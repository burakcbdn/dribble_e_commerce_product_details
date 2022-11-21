import 'package:flutter/material.dart';

// Product model

class ProductModel {
  final Color mainColor;
  final String name;
  final double price;
  final String image;
  final String description;
  final String special;

  ProductModel({
    required this.mainColor,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.special,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      mainColor: Color(int.parse(json['mainColor'])),
      name: json['name'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
      special: json['special'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mainColor': mainColor.value,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'special': special,
    };
  }
}
