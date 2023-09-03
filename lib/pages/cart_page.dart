import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/components/quantity_counter.dart';
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
                          color: secondaryColor.withOpacity(.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                            top: 20,
                            bottom: 20,
                            right: 0,
                          ),
                          title: Text(
                            foodItem.name,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          trailing: SizedBox(
                            width: 150,
                            child: QuantityCounter(
                              itemQuantity: shopModel.getAddedQuantity(
                                foodItem.id,
                              ),
                              onValueChanged: (currentCount) {
                                if (currentCount == 0) {
                                  shopModel.removeItem(foodItem.id);
                                  // remove item from the cart
                                } else {
                                  shopModel.setItemQuantity(
                                    foodItem.id,
                                    currentCount,
                                  );
                                }
                              },
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              '\$${_getTotalPrice(
                                shopModel.getAddedQuantity(foodItem.id),
                                double.tryParse(foodItem.price) ?? 0,
                              )}',
                              style: TextStyle(
                                color: Colors.grey[200],
                              ),
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

  double _getTotalPrice(int quantity, double unitPrice) {
    return quantity * unitPrice;
  }
}
