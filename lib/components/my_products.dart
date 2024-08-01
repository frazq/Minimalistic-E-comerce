import 'package:flutter/material.dart';
import 'package:minimal_ecomerce/models/product.dart';
import 'package:minimal_ecomerce/models/shop.dart';
import 'package:provider/provider.dart';

class MyProducts extends StatelessWidget {
  final Product product;

  const MyProducts({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context) =>  AlertDialog(
        content: const Text("Add this item?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
            ),
            
            MaterialButton(
            onPressed: () {

              Navigator.pop(context);

              context.read<Shop>().addToCart(product);
            },
            child: const Text("Yes"),
            ),
        ],
      ),
    
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(25),
            child: Image.asset(product.imagePath),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        //product name

        Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 20
            ),
        ),

        const SizedBox(
          height: 10,
        ),
        //product description
        Text(product.description, style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),),

        const SizedBox(
          height: 25,
        ),
        //product price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${product.price.toStringAsFixed(2)}'),


            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () => addToCart(context), 
                icon: const Icon(Icons.add),
                ),
            ),
          ],
        )
        ],)
      ]),
    );
  }
}
