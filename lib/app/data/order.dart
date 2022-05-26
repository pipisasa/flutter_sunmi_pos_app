// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:boomerang_pos/app/data/user_model.dart';
import 'package:boomerang_pos/utils/firestore_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'order.g.dart';

class OrderItemStatuses {
  static const String NEW = 'NEW';
  static const String WITH_COURIER = 'WITH_COURIER';
  static const String COOKING = 'COOKING';
  static const String COURIER_WAIT_ORDER = 'COURIER_WAIT_ORDER';
  static const String IN_TRANSIT = 'IN_TRANSIT';
  static const String ALREADY_HERE = 'ALREADY_HERE';
  static const String DELIVERED = 'DELIVERED';
  static const String CANCELED = 'CANCELED';
}

@JsonSerializable()
class Order {
  final int? id;
  final String? slug;
  final List<String>? available_couriers;
  final String? admin;
  @JsonKey(fromJson: firestoreDocRefFromJson, toJson: firestoreDocRefToJson)
  final DocumentReference? courier;
  final String? assignedCourier;
  @JsonKey(
      fromJson: firestoreTimestampFromJson, toJson: firestoreTimestampToJson)
  final Timestamp? created_at;
  @Min(0)
  final int? cutlery;
  @Min(0)
  @JsonKey(fromJson: firestoreNumberFromJson, toJson: firestoreNumberToJson)
  final num? delivery_price;
  final String? delivery_time;
  @JsonKey(
    fromJson: firestoreOrdersMapFromJSON,
    toJson: firestoreOrdersMapToJson,
  )
  final Map<String, OrderItem>? items;
  @Min(0)
  @JsonKey(fromJson: firestoreNumberFromJson, toJson: firestoreNumberToJson)
  final num? items_price;
  @Min(0)
  @JsonKey(fromJson: firestoreNumberFromJson, toJson: firestoreNumberToJson)
  final num? money_change;
  final String? notes;
  final String? pay_type;
  @JsonKey(fromJson: RestaurantFromJson, toJson: RestaurantToJson)
  final Restaurant? restaurant;
  final String? status;
  final bool? take_it_myself;
  @JsonKey(
      fromJson: firestoreTimestampFromJson, toJson: firestoreTimestampToJson)
  final Timestamp? time_for_delivery;
  @Min(0)
  @JsonKey(fromJson: firestoreNumberFromJson, toJson: firestoreNumberToJson)
  final num? total_price;
  @JsonKey(
      fromJson: firestoreTimestampFromJson, toJson: firestoreTimestampToJson)
  final Timestamp? updated_at;
  @JsonKey(fromJson: OrderClientFromJson, toJson: OrderClientToJson)
  final OrderClient? user;
  final int? order;

  Order({
    this.id,
    this.slug,
    this.available_couriers,
    this.admin,
    this.courier,
    this.assignedCourier,
    this.created_at,
    this.cutlery,
    this.delivery_price,
    this.delivery_time,
    this.items,
    this.items_price,
    this.money_change,
    this.notes,
    this.pay_type,
    this.restaurant,
    this.status,
    this.take_it_myself,
    this.time_for_delivery,
    this.total_price,
    this.updated_at,
    this.user,
    this.order,
  });

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
  Map<String, Object?> toJson() => _$OrderToJson(this);

  static const Map<String, String> orderItemStatusDictionary = {
    'NEW': 'Новый',
    'WITH_COURIER': 'С курьером',
    'COOKING': 'Готовится',
    'COURIER_WAIT_ORDER': 'Ожидает заказа',
    'IN_TRANSIT': 'В пути',
    'ALREADY_HERE': 'Заказ прибыл',
    'DELIVERED': 'Доставлен',
    'CANCELED': 'Отменен',
  };

  static const Map<String, Color> orderItemStatusColors = {
    'NEW': Colors.green,
    'WITH_COURIER': Colors.blue,
    'COOKING': Colors.cyan,
    'COURIER_WAIT_ORDER': Colors.amber,
    'IN_TRANSIT': Colors.indigo,
    'ALREADY_HERE': Colors.green,
    'DELIVERED': Colors.green,
    'CANCELED': Colors.red,
  };

  static String getLocaleStatus(String? status,
      {List<String> excludeStatuses = const [],
        String defaultStatus = 'Неизвестно'}) {
    if (excludeStatuses.contains(status)) {
      return defaultStatus;
    }
    return orderItemStatusDictionary[status] ?? status ?? defaultStatus;
  }

  static Color getStatusColor(String? status) {
    return orderItemStatusColors[status] ?? Colors.black;
  }
}

Order? orderfromJson(Map<String, Object?>? json) =>
    json != null ? _$OrderFromJson(json) : null;
Map<String, Object?>? orderToJson(Order? order) =>
    order != null ? _$OrderToJson(order) : null;

@JsonSerializable()
class Restaurant {
  final int? pk;
  final String? slug;
  final String? address;
  final String? name;
  @JsonKey(fromJson: firestoreGeoPointFromJson, toJson: firestoreGeoPointToJson)
  final GeoPoint? geolocation;

  const Restaurant(
      {this.pk, this.address, this.name, this.geolocation, this.slug});

  factory Restaurant.fromJson(Map<String, Object?> json) =>
      _$RestaurantFromJson(json);
  Map<String, Object?> toJson() => _$RestaurantToJson(this);
}

Restaurant? RestaurantFromJson(Map<String, Object?>? json) =>
    json != null ? _$RestaurantFromJson(json) : null;
Map<String, Object?>? RestaurantToJson(Restaurant? value) =>
    value != null ? _$RestaurantToJson(value) : null;

@JsonSerializable()
class OrderItem {
  final String? id;
  final String? image;
  final double? price;
  final int? quantity;
  final String? title;
  final int? order;

  OrderItem({
    required this.id,
    required this.image,
    required this.price,
    required this.quantity,
    required this.title,
    this.order,
  });

  factory OrderItem.fromJson(Map<String, Object?> json) =>
      _$OrderItemFromJson(json);
  Map<String, Object?> toJson() => _$OrderItemToJson(this);
}

OrderItem? OrderItemFromJson(Map<String, Object?>? json) =>
    json != null ? _$OrderItemFromJson(json) : null;
Map<String, Object?>? OrderItemToJson(OrderItem? value) =>
    value != null ? _$OrderItemToJson(value) : null;

@JsonSerializable()
class OrderClient {
  final String uid;
  @JsonKey(fromJson: AddressFromJson, toJson: AddressToJson)
  final Address? address;
  final String? email;
  final String? name;
  final String? phone;

  OrderClient({
    required this.uid,
    this.address,
    this.email,
    this.name,
    this.phone,
  });
  factory OrderClient.fromJson(Map<String, Object?> json) =>
      _$OrderClientFromJson(json);
  Map<String, Object?> toJson() => _$OrderClientToJson(this);
}

OrderClient? OrderClientFromJson(Map<String, Object?>? json) =>
    json != null ? _$OrderClientFromJson(json) : null;
Map<String, Object?>? OrderClientToJson(OrderClient? value) =>
    value != null ? _$OrderClientToJson(value) : null;

@Collection<Order>('orders')
final ordersRef = OrderCollectionReference();
