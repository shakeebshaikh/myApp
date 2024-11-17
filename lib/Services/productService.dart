import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../Models/product_model.dart'; // Import your product model

class ProductService {
  final Box<Product> _productBox = Hive.box<Product>('products');

  /// Function to add a product to Hive
  Future<void> addProduct({
    required String name,
    required double price,
    required double offerPrice,
    required int quantity,
    required String description,
    required File imagePaths, // List of image file paths
  }) async {
    try {
      final newProduct = Product(
        name: name,
        price: price,
        offerPrice: offerPrice,
        quantity: quantity,
        description: description,
        imagePath: imagePaths,
      );

      // Add the product to Hive
      await _productBox.add(newProduct);
      debugPrint("Product added successfully!");
    } catch (e) {
      debugPrint("Error adding product: $e");
    }
  }
}
