import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../medPages/diabetes.dart';

class DiabetesCartPage extends StatelessWidget {
  final List<CartItem> cartItems;

  DiabetesCartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final indianCurrencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹');

    double totalPrice = 0;
    cartItems.forEach((item) {
      totalPrice += item.getTotalPrice();
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                cartItems[index].product.imagePath,
                                width: constraints.maxWidth > 400 ? 80.0 : 60.0,
                                height:
                                    constraints.maxWidth > 400 ? 80.0 : 60.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItems[index].product.name,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth > 400
                                          ? 18.0
                                          : 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Quantity: ${cartItems[index].quantity}',
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth > 400
                                          ? 14.0
                                          : 12.0,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Total Price: ${indianCurrencyFormat.format(cartItems[index].getTotalPrice())}',
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth > 400
                                          ? 14.0
                                          : 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price: ${indianCurrencyFormat.format(totalPrice)}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Buy Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
