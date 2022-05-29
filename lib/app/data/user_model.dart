// ignore_for_file: non_constant_identifier_names

import 'package:boomerang_pos/utils/firestore_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String? email;
  final bool emailVerified;
  final String? photoURL;
  final String? displayName;
  final String? name;
  final String? phoneNumber;
  final bool? disabled;
  final bool? isAdmin;
  final bool? isCourier;
  final bool? isRestaurant;
  final bool? isActiveCourier;
  final List<String>? deviceIds;
  @JsonKey(fromJson: firestoreDocRefFromJson, toJson: firestoreDocRefToJson)
  final DocumentReference? selectedAddress;

  const UserModel({
    required this.uid,
    required this.email,
    required this.emailVerified,
    required this.photoURL,
    required this.displayName,
    required this.name,
    this.phoneNumber,
    this.disabled,
    this.isAdmin,
    this.isCourier,
    this.isRestaurant,
    this.isActiveCourier,
    this.selectedAddress,
    this.deviceIds,
  });
  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
  Map<String, Object?> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Address {
  @JsonKey(fromJson: firestoreGeoPointFromJson, toJson: firestoreGeoPointToJson)
  final GeoPoint? geolocation;
  final String? apartment_number;
  final String? code_intercom;
  final String? entrance;
  final String? floor;
  final String? format_address;
  final bool? is_private_house;
  final String? name;
  final int? order;

  const Address({
    this.geolocation,
    this.apartment_number,
    this.code_intercom,
    this.entrance,
    this.floor,
    this.format_address,
    this.is_private_house,
    this.name,
    this.order,
  });

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
  Map<String, Object?> toJson() => _$AddressToJson(this);
}

Address? firestoreAddressFromJson(Map<String, Object?>? json) =>
    json != null ? _$AddressFromJson(json) : null;
Map<String, Object?>? firestoreAddressToJson(Address? address) =>
    address != null ? _$AddressToJson(address) : null;

@JsonSerializable()
class UserDeviceTokens {
  final String token;
  @JsonKey(
      fromJson: firestoreTimestampFromJson, toJson: firestoreTimestampToJson)
  final Timestamp? createdAt;
  final String platform;

  const UserDeviceTokens({
    required this.token,
    required this.createdAt,
    required this.platform,
  });

  factory UserDeviceTokens.fromJson(Map<String, Object?> json) =>
      _$UserDeviceTokensFromJson(json);
  Map<String, Object?> toJson() => _$UserDeviceTokensToJson(this);
}

UserDeviceTokens? firestoreUserDeviceTokensFromJson(
        Map<String, Object?>? json) =>
    json != null ? _$UserDeviceTokensFromJson(json) : null;
Map<String, Object?>? firestoreUserDeviceTokensToJson(
        UserDeviceTokens? value) =>
    value != null ? _$UserDeviceTokensToJson(value) : null;

@Collection<UserModel>('users')
@Collection<Address>('users/*/addresses')
@Collection<UserDeviceTokens>('users/*/deviceTokens')
final usersRef = UserModelCollectionReference();

// final AddressCollectionReference addressesRef = usersRef.doc('myDocumentID').addresses;