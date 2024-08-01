import 'package:flutter/material.dart';
import 'package:minimal_ecomerce/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag,
            size: 72,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),

          const SizedBox(height: 25),

          const Text("Minko Merch",
            style:TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold

            ),
          ),

          const SizedBox(height: 10),

           Text("Alternative style is for u and everyone ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            ),
      
          const SizedBox(height: 25),

            MyButton(onTap: () => Navigator.pushNamed(context, '/shop_pages'), child: const Icon(Icons.arrow_forward))

            ],
      ),
      ),
    );
  }
}
