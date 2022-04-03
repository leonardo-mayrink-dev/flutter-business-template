import 'dart:convert';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_business_template/1_domain/3_enums/user_roles.dart';
import 'address.dart';

class AppUser {
  String? userId;
  String fullName;
  String email;
  String? password;
  String? imageUrl;
  String? role;
  List<Address>? adresses;

  AppUser({
    this.userId,
    required this.fullName,
    required this.email,
    this.password,
    this.imageUrl,
    this.role,
    this.adresses,
  });

  bool get isValid =>
      (userId?.isNotEmpty ?? false) && fullName.isNotEmpty && email.isNotEmpty;

  AppUser copyWith({
    String? userId,
    String? fullName,
    String? email,
    String? imageUrl,
    String? role,
    List<Address>? adresses,
  }) {
    return AppUser(
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        imageUrl: imageUrl ?? this.imageUrl,
        role: role ?? this.role,
        adresses: adresses ?? this.adresses);
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId ?? "",
      'fullName': fullName,
      'email': email,
      'imageUrl': imageUrl ?? "",
      'role': role ?? UserRole.USER.toString().split('.').last,
      'adresses': _getAdresses(),
    };
  }

  factory AppUser.fromMap(Map<dynamic, dynamic> map) {
    return AppUser(
      userId: map['userId'] ?? "",
      fullName: map['fullName'],
      email: map['email'],
      imageUrl: map['imageUrl'] ?? "",
      role: map['role'] ?? UserRole.USER.toString().split('.').last,
      adresses: _mapAdresses(map['adresses']),
    );
  }

  factory AppUser.fromDS(String? id, Map<dynamic, dynamic> map) {
    var user = AppUser.fromMap(map);
    user.userId = user.userId ?? id;
    return user;
  }

  factory AppUser.fromAppUser(AppUser user) {
    return AppUser(
      userId: user.userId,
      fullName: user.fullName,
      email: user.email,
      imageUrl: user.imageUrl,
      role: user.role,
      adresses: List.from(user.adresses!),
    );
  }

  factory AppUser.empty() {
    return AppUser(
      userId: '',
      fullName: '',
      email: '',
      password: '',
      imageUrl: '',
      role: UserRole.USER.toString().split('.').last,
      adresses: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(userId: $userId, fullName: $fullName, email: $email, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.userId == userId &&
        other.fullName == fullName &&
        other.email == email &&
        other.imageUrl == imageUrl &&
        other.role == role;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        imageUrl.hashCode ^
        role.hashCode;
  }

  void clear() {
    userId = '';
    fullName = '';
    email = '';
    imageUrl = '';
    password = '';
    role = UserRole.USER.toString().split('.').last;
    adresses = [];
  }

  String get simplifiedName {
    String simplifiedName = '';
    if (StringUtils.isNotNullOrEmpty(fullName)) {
      var parts = fullName.split(' ');
      if (parts.length > 1) {
        simplifiedName = parts[0] + ' ' + parts[parts.length - 1];
      } else {
        simplifiedName = parts[0];
      }
    }
    return simplifiedName;
  }

  void addAddress(Address address) {
    if (adresses == null) adresses = [];
    adresses!.add(address);
  }

  List<Map<String, dynamic>> _getAdresses() {
    List<Map<String, dynamic>> adressesAux = [];
    if (adresses != null) {
      for (int i = 0; i < adresses!.length; i++) {
        adressesAux.add(adresses![i].toMap());
      }
    }
    return adressesAux;
  }

  static List<Address> _mapAdresses(dynamic mapAdresses) {
    Iterable? list = mapAdresses;
    List<Address> adressesAux = [];
    if (list != null && list.length > 0) {
      adressesAux = list.map((i) => Address.fromJson(json.encode(i))).toList();
    }
    return adressesAux;
  }

  void updateAddress(Address oldAddress, Address newAddress) {
    int index = adresses?.indexOf(oldAddress) ?? -1;
    if (index > -1) {
      adresses![index].city = newAddress.city;
      adresses![index].neighborhood = newAddress.neighborhood;
      adresses![index].street = newAddress.street;
      adresses![index].postCode = newAddress.postCode;
      adresses![index].houseNumber = newAddress.houseNumber;
      adresses![index].roomNumber = newAddress.roomNumber;
    }
  }
}
