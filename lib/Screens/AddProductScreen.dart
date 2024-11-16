import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  static const formLableStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

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
                  Container(
                    color: Colors.grey[400],
                    height: 80,
                    width: 80,
                    child: const Icon(Icons.add_a_photo),
                  ),
                  const SizedBox(height: 14,),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Name',
                        labelText: 'Product Name'),
                  ),
                  const SizedBox(height: 14,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Price',
                        labelText: 'Product Price'),
                  ),
                  const SizedBox(height: 14,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Offer Price',
                        labelText: 'Product Offer Price'),
                  ),
                  const SizedBox(height: 14,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Quantity',
                        labelText: 'Product Quantity'),
                  ),
                  const SizedBox(height: 14,),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Product Description',
                        labelText: 'Product Description'),
                  ),
                  const SizedBox(height: 14,),
                  Center(
                    child: ElevatedButton(onPressed: (){}, 
                    child:const Text('Save Product')),
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
