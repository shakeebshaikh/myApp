import 'package:flutter/material.dart';
import 'package:my_app/UI/EndDrawer.dart';
import 'package:hive/hive.dart';
import 'package:my_app/Models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Product>> fetchProducts() async {
    print('function called');
    try {
      // Open the box
      final box = await Hive.openBox<Product>('products');

      // Get all products as a list
      List<Product> productList = box.values.toList();
      print('productList------------------');
      print(productList[0].name);
      return productList;
      
    } catch (e) {
      // Handle errors
      debugPrint('Error fetching products: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const EndDrawer(),
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: Column(
          children: [
            FutureBuilder<List<Product>>(
              future: fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error fetching products.');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No products found.');
                }
            
                // Display the products in a list
                final products = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        leading: Image.file(product.imagePath!),
                        title: Text(product.name),
                        subtitle: Text('Price: \$${product.price}'),
                        trailing: product.quantity>0 ? const Icon(Icons.shopping_cart_checkout) :const Text('Out of Stock'),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
