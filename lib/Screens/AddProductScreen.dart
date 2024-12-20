import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/Screens/HomeScreen.dart';
import 'package:my_app/Services/productService.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _offerPriceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  static const formLableStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _saveProduct() async {
    if (_formKey.currentState!.validate()) {
      try {
        final productService = ProductService();
        await productService.addProduct(
          name: _nameController.text.trim(),
          price: double.parse(_priceController.text.trim()),
          offerPrice: double.parse(_offerPriceController.text.trim()),
          quantity: int.parse(_quantityController.text.trim()),
          description: _descriptionController.text.trim(),
          imagePaths: _selectedImage!, // Ensure this is a List<String>
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully!')),
        );
        Navigator.pop(context); // Navigate back after saving
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add product: $e')),
        );
      }
    }
  }

  Future<void> _pickImages() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      } else {
        // User canceled the picker
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Product Image',
                    style: formLableStyle,
                  ),
                  InkWell(
                    onTap: () {
                      _pickImages();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          border: Border.all(
                              color: const Color.fromARGB(255, 45, 45, 45)),
                          borderRadius: BorderRadius.circular(8)),
                      height: 80,
                      width: 80,
                      child: const Icon(Icons.add_a_photo),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  if (_selectedImage != null) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        border: Border.all(
                            color: const Color.fromARGB(255, 45, 45, 45)),
                      ),
                      height: 80,
                      width: 80,
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _selectedImage = null;
                          });
                        },
                        child: const Text(
                          'Remove',
                          textAlign: TextAlign.center,
                        )),
                  ],
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Product name is required';
                      }
                      return null;
                    },
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Name',
                        labelText: 'Product Name'),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Price is required';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Price',
                        labelText: 'Product Price'),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Offer Price is required';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    controller: _offerPriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Offer Price',
                        labelText: 'Product Offer Price'),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Quantity is required';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Quantity',
                        labelText: 'Product Quantity'),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Product name is required';
                      }
                      return null;
                    },
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Description',
                        labelText: 'Product Description'),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          _saveProduct();
                        },
                        child: const Text('Save Product')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
