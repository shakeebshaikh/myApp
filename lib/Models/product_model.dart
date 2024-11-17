import 'dart:io';

import 'package:hive/hive.dart';

part 'product_model.g.dart'; // Needed for Hive type generation

@HiveType(typeId: 0) // Assign a unique typeId for the model
class Product extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final double price;

  @HiveField(2)
  final double offerPrice;

  @HiveField(3)
  final int quantity;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final File? imagePath;

  Product({
    required this.name,
    required this.price,
    required this.offerPrice,
    required this.quantity,
    required this.description,
    this.imagePath,
  });
}
