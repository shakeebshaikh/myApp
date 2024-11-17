import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/Models/file_adapter.dart';
import 'package:my_app/Models/product_model.dart';
import 'package:my_app/Screens/HomeScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FileAdapter());
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<Product>('products');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: Colors.teal,
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
          iconTheme: IconThemeData(
            color: Colors.white
          )
        )
      ),
      home: const HomeScreen(),
    );
  }
}


