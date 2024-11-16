import 'package:flutter/material.dart';
import 'package:my_app/UI/EndDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        drawer: const EndDrawer(),
        appBar: AppBar(
          title: const Text('My App'),
        ),
      ),
    );
  }
}