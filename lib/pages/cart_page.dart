import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shopModel, child) {
        return Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            elevation: 0,
            title: const Text('Cart'),
            backgroundColor: primaryColor,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    itemBuilder: (context, index) {
                      final foodItem = shopModel.cartItems[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            foodItem.name,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              shopModel.removeFromCart(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey[200],
                            ),
                          ),
                          subtitle: Text(
                            '\$${foodItem.price}',
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemCount: shopModel.cartItems.length,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: MyButton(
                    text: 'Pay now!',
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
