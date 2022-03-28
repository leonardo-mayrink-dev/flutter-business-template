import 'dart:convert';
import 'package:flutter/material.dart';

class Product {
  final String image;
  final String title;
  final String description;
  final int price;
  final int size;
  final int id;
  final Color color;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.id,
    required this.color,
  });

  Product copyWith({
    String? image,
    String? title,
    String? description,
    int? price,
    int? size,
    int? id,
    Color? color,
  }) {
    return Product(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      size: size ?? this.size,
      id: id ?? this.id,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'price': price,
      'size': size,
      'id': id,
      'color': color.value,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      image: map['image'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      size: map['size'],
      id: map['id'],
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(image: $image, title: $title, description: $description, price: $price, size: $size, id: $id, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.image == image &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.size == size &&
        other.id == id &&
        other.color == color;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        size.hashCode ^
        id.hashCode ^
        color.hashCode;
  }
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
