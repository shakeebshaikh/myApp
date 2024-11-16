import 'package:flutter/material.dart';
import 'package:my_app/Screens/AddProductScreen.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width /1.5,
      child:   Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return AddProductScreen();
                },
              ));
            },
            leading: const Icon(Icons.add),
            title: const Text('Add Product'),
          )
        ],
      ),
    );
  }
}