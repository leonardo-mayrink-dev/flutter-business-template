import 'dart:convert';
import 'package:basic_utils/basic_utils.dart';

class Address {
  String city;
  String neighborhood;
  String street;
  String postCode;
  String houseNumber;
  String roomNumber;

  Address({
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.postCode,
    required this.houseNumber,
    required this.roomNumber,
  });

  bool get isFilledUp =>
      StringUtils.isNotNullOrEmpty(city) &&
      StringUtils.isNotNullOrEmpty(neighborhood) &&
      StringUtils.isNotNullOrEmpty(street) &&
      StringUtils.isNotNullOrEmpty(postCode) &&
      StringUtils.isNotNullOrEmpty(houseNumber);

  Address copyWith({
    String? city,
    String? neighborhood,
    String? street,
    String? postCode,
    String? houseNumber,
    String? roomNumber,
  }) {
    return Address(
      city: city ?? this.city,
      neighborhood: neighborhood ?? this.neighborhood,
      street: street ?? this.street,
      postCode: postCode ?? this.postCode,
      houseNumber: houseNumber ?? this.houseNumber,
      roomNumber: roomNumber ?? this.roomNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'postCode': postCode,
      'houseNumber': houseNumber,
      'roomNumber': roomNumber,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      city: map['city'] ?? "",
      neighborhood: map['neighborhood'] ?? "",
      street: map['street'] ?? "",
      postCode: map['postCode'] ?? "",
      houseNumber: map['houseNumber'] ?? "",
      roomNumber: map['roomNumber'] ?? "",
    );
  }

  factory Address.empty() {
    return Address(
      city: "",
      neighborhood: "",
      street: "",
      postCode: "",
      houseNumber: "",
      roomNumber: "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(city: $city, neighborhood: $neighborhood, street: $street, postCode: $postCode, houseNumber: $houseNumber, roomNumber: $roomNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.city == city &&
        other.neighborhood == neighborhood &&
        other.street == street &&
        other.postCode == postCode &&
        other.houseNumber == houseNumber &&
        other.roomNumber == roomNumber;
  }

  @override
  int get hashCode {
    return city.hashCode ^
        neighborhood.hashCode ^
        street.hashCode ^
        postCode.hashCode ^
        houseNumber.hashCode ^
        roomNumber.hashCode;
  }

  String get formatedAddress {
    String formatedAddress = "";
    if (StringUtils.isNotNullOrEmpty(street)) {
      formatedAddress = street + ', ';
    }
    if (StringUtils.isNotNullOrEmpty(houseNumber)) {
      formatedAddress = formatedAddress + houseNumber + ', ';
    }
    if (StringUtils.isNotNullOrEmpty(roomNumber)) {
      formatedAddress = formatedAddress + roomNumber + '.';
    }
    if (StringUtils.isNotNullOrEmpty(neighborhood)) {
      formatedAddress = formatedAddress + '\nBairro: ' + neighborhood + '.';
    }
    if (StringUtils.isNotNullOrEmpty(neighborhood)) {
      formatedAddress = formatedAddress + '\n' + city + '.';
    }
    if (StringUtils.isNotNullOrEmpty(postCode)) {
      formatedAddress = formatedAddress + '\nCEP: ' + postCode;
    }
    return formatedAddress;
  }
}
