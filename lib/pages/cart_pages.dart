import 'package:flutter/material.dart';
import 'package:minimal_ecomerce/components/my_button.dart';
import 'package:minimal_ecomerce/models/product.dart';
import 'package:minimal_ecomerce/models/shop.dart';
import 'package:provider/provider.dart';

class CartPages extends StatelessWidget {
  const CartPages({super.key});

  //remove item
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context, 
      builder: (context) =>  AlertDialog(
        content: const Text("Remove your item?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
            ),
            MaterialButton(
            onPressed: () {

              Navigator.pop(context);

              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
            ),
        ],
    ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(context: context, builder: (context) => const AlertDialog(
      content: Text("Choose payment"),
    )
    
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty ? 
            const Center(child: Text("Your cart is empty..")): ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index){
              //individual item in cart
              final item = cart[index];

              //return as a cart
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.price.toStringAsFixed(2)),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => removeItemFromCart(context, item),
                ),
              );
            }),
            ),
            //pay button
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(onTap: () => payButtonPressed(context), child: const Text("Pay")))
        ],
      ),
    );
  }
}