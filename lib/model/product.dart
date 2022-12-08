// To parse this JSON data, do
//
//     final prodect = prodectFromJson(jsonString);

import 'dart:convert';

Product prodectFromJson(String str) => Product.fromJson(json.decode(str));

String prodectToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.productNumber,
    required this.productName,
    required this.category,
    required this.quantity,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  String? productNumber;
  final String productName;
  final String category;
  final int quantity;
  final double price;
  final String description;
  String imageUrl;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productNumber: json["productNumber"],
        productName: json["productName"],
        category: json["category"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        description: json["description"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "productNumber": productNumber,
        "productName": productName,
        "category": category,
        "quantity": quantity,
        "price": price,
        "description": description,
        "imageUrl": imageUrl,
      };
}
