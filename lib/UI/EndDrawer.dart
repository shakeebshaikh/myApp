import 'package:flutter/material.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width /1.5,
      child: const Column(
        children: [
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Product'),
          )
        ],
      ),
    );
  }
}