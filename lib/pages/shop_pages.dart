import 'package:flutter/material.dart';
import 'package:minimal_ecomerce/components/my_drawer.dart';
import 'package:minimal_ecomerce/components/my_products.dart';


import 'package:minimal_ecomerce/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPages extends StatelessWidget {
  const ShopPages({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Shop"),
          actions: [
            IconButton(onPressed: () => Navigator.pushNamed(context, '/cart_page'), 
            icon: const Icon(Icons.shopping_bag_outlined)
            ),
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            const SizedBox(height: 25,),
              Center(child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
             ),),

            SizedBox(
              height: 550,
          child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              final product = products[index];
          
              return MyProducts(product: product);
            },
            )
            )
          ],
           
          ),
        );
  }
}
