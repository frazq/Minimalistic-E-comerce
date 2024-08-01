import 'package:flutter/material.dart';
import 'package:minimal_ecomerce/models/product.dart';

class Shop extends ChangeNotifier{
  //products
  final List<Product> _shop = [
    Product(
        name: "Pretty kitty t-shirt",
        price: 18.99,
        description: "Pretty kitty t-shirt",
        imagePath: 'assets/kitty.png',
    ),
    Product(
        name: "Pretty kitty t-shirt/BLACK",
        price: 18.99,
        description: "Pretty kitty t-shirt Black",
        imagePath: 'assets/kitty_black.png',
        
    ),
    Product(
        name: "Cmentary t-shirt",
        price: 14.99,
        description: "Cementary T-shirt ghotic style",
        imagePath: 'assets/cementary.png',
    ),
    Product(
        name: "Sticker",
        price: 9.99,
        description: "Sticker logo bones",
        imagePath: 'assets/logo.png',
        
    )
  ];
  //user cart
  final List<Product> _cart = [];
  //get product
  List<Product> get shop => _shop;
  //get user cart
  List<Product> get cart => _cart;
  //add item
  void addToCart(Product item) {
    _cart.add(item); 
    notifyListeners();
  }
  //remove item
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
