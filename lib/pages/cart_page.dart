import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Cart',
            style: GoogleFonts.dmSerifDisplay(),
          ),
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
                    final foodItem = value.shopItems[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          foodItem.name,
                          style: GoogleFonts.dmSerifDisplay(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        leading: Image.asset(foodItem.imagePath),
                        trailing: IconButton(
                          onPressed: () {
                            value.removeFromCart(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey[200],
                          ),
                        ),
                        subtitle: Text(
                          '\$${foodItem.price}',
                          style: GoogleFonts.dmSerifDisplay(
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: value.shopItems.length,
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
    });
  }
}
