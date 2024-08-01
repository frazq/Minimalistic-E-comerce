import 'package:flutter/material.dart';
import 'package:minimal_ecomerce/models/shop.dart';
import 'package:minimal_ecomerce/pages/cart_pages.dart';
import 'package:minimal_ecomerce/pages/intro_page.dart';
import 'package:minimal_ecomerce/pages/shop_pages.dart';
import 'package:minimal_ecomerce/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     debugShowCheckedModeBanner: false,
     home: const IntroPage(),
     theme: lightMode,
     routes: {
      '/intro': (context) => const IntroPage(),
       '/shop_pages': (context) => const ShopPages(),
      '/cart_page':(context) => const CartPages(),
     },
    );
  }
}
