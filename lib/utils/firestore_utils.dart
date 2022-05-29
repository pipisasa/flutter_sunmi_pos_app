import 'dart:convert';

import 'package:boomerang_pos/app/data/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//? Firestore Reference
dynamic firestoreDocRefToJson(dynamic value) => value;
DocumentReference? firestoreDocRefFromJson(dynamic value) {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  if (value is String) {
    return _firestore.collection('users').doc(value);
  }
  if (value is DocumentReference) return value;
  return null;
}

//? Firestore Reference List
dynamic firestoreListDocRefToJson(dynamic value) => value;
List<DocumentReference> firestoreListDocRefFromJson(List value) {
  final List<DocumentReference> list = [];
  for (var element in value) {
    var ref = firestoreDocRefFromJson(element);
    if (ref != null) list.add(ref);
  }
  return list;
}

//? Map of Orders -- Map<String, Model>
Map<String, Map<String, dynamic>>? firestoreOrdersMapToJson(dynamic value) =>
    (value as Map<String, OrderItem>?)?.map((k, v) => MapEntry(k, v.toJson()));

Map<String, OrderItem>? firestoreOrdersMapFromJSON(dynamic value) =>
    (value as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, OrderItem.fromJson(e as Map<String, dynamic>)),
    );

//? Firestore Timestamp
dynamic firestoreTimestampToJson(dynamic value) => value;
Timestamp? firestoreTimestampFromJson(dynamic value) {
  if (value is Timestamp) return value;
  if (value is String) return Timestamp.fromDate(DateTime.parse(value));
  if (value is DateTime) return Timestamp.fromDate(value);
  if (value is int) return Timestamp.fromMillisecondsSinceEpoch(value);
  if (value is num) return Timestamp.fromMillisecondsSinceEpoch(value.toInt());
  return null;
  // return Timestamp.fromMillisecondsSinceEpoch(value.millisecondsSinceEpoch);
}

//? Firestore GeoPoint
dynamic firestoreGeoPointToJson(dynamic value) => value;
GeoPoint? firestoreGeoPointFromJson(dynamic value) {
  if (value is GeoPoint) return value;
  if (value is String) {
    var decodedJson = json.decode(value);
    return GeoPoint(decodedJson['latitude'], decodedJson['longitude']);
  }
  return null;
}

//? Firestore number
dynamic firestoreNumberToJson(num? value) => value;
num? firestoreNumberFromJson(dynamic value) {
  if (value is num) return value;
  if (value is String) return num.parse(value);
  return null;
}

//? Firestore double
dynamic firestoreDoubleToJson(double? value) => value;
double? firestoreDoubleFromJson(dynamic value) {
  if (value is double) return value;
  if (value is String) return double.parse(value);
  if (value is num) return value.toDouble();
  if (value is int) return value.toDouble();
  return null;
}
