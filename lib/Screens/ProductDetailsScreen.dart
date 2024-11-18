import 'package:flutter/material.dart';

import '../Models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product? product;
  const ProductDetailsScreen({super.key, this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final TextStyle labelStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.product!.name),
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.file(
                  widget.product!.imagePath!,
                  width: MediaQuery.sizeOf(context).width / 1.1,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                indent: 2,
                endIndent: 2,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Name : ${widget.product!.name}',
                style: labelStyle,
              ),
              Text(
                'Price : ${widget.product!.price.toString()}',
                style: labelStyle,
              ),
              Text(
                'Offer Price : ${widget.product!.offerPrice.toString()}',
                style: labelStyle,
              ),
              Text(
                'Description : ${widget.product!.description}',
                style: labelStyle,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.product!.quantity >0 ? () {} : null,
                  child: const Text(
                    'Add to cart',
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
