import 'package:flutter/material.dart';

import '../Models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product? product;
  const ProductDetailsScreen({super.key, this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product!.name),
      ),
      body:Container(
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.file(widget.product!.imagePath!,
              width: MediaQuery.sizeOf(context).width / 1.2,),
            ),
            const Divider(),
            Text(widget.product!.name),
            Text(widget.product!.price.toString()),
            Text(widget.product!.offerPrice.toString()),
            Text(widget.product!.description),
          ],
        ),
      )
    );
  }
}