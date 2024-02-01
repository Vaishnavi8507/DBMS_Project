import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../cartPage/diabCart.dart';

class Diabetes extends StatefulWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  State<Diabetes> createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
  List<CartItem> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Find your Diabetes Specialists',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Popular Medicines',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DiabetesCartPage(cartItems: selectedItems),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: diabetesSpecialistsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return DiabetesCard(
                    specialist: diabetesSpecialistsData[index],
                    onAddToCart: (CartItem cartItem) {
                      setState(() {
                        selectedItems.add(cartItem);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiabetesCard extends StatefulWidget {
  final DiabetesSpecialist specialist;
  final Function(CartItem) onAddToCart;

  DiabetesCard({required this.specialist, required this.onAddToCart});

  @override
  _DiabetesCardState createState() => _DiabetesCardState();
}

class _DiabetesCardState extends State<DiabetesCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final indianCurrencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹');

    return Container(
      width: 180.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  widget.specialist.imagePath,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            widget.specialist.name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.0),
          Text(
            '${indianCurrencyFormat.format(widget.specialist.price)}',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (quantity > 0) {
                      quantity--;
                    }
                  });
                },
              ),
              Text(
                '$quantity',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 4.0),
          ElevatedButton(
            onPressed: () {
              if (quantity > 0) {
                CartItem cartItem = CartItem(
                  product: widget.specialist,
                  quantity: quantity,
                );
                widget.onAddToCart(cartItem);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item added to cart'),
                  ),
                );
                setState(() {
                  quantity = 0;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please select the quantity'),
                  ),
                );
              }
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final DiabetesSpecialist product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  double getTotalPrice() {
    return product.price * quantity;
  }
}

class DiabetesSpecialist {
  final String name;
  double price;
  final String imagePath;

  DiabetesSpecialist({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

final List<DiabetesSpecialist> diabetesSpecialistsData = [
  DiabetesSpecialist(
    name: 'Diabliss',
    price: 20,
    imagePath: 'assets/images/diabliss.png',
  ),
  DiabetesSpecialist(
    name: 'Sugar Free Gold',
    price: 30,
    imagePath: 'assets/images/sugar.png',
  ),
  DiabetesSpecialist(
    name: 'Sugar Free',
    price: 25,
    imagePath: 'assets/images/s_free.png',
  ),
  DiabetesSpecialist(
    name: 'Metmorphin',
    price: 25,
    imagePath: 'assets/images/metmorphin.png',
  ),
  DiabetesSpecialist(
    name: 'Metmorphin',
    price: 25,
    imagePath: 'assets/images/met.png',
  ),
  DiabetesSpecialist(
    name: 'Diabliss',
    price: 20,
    imagePath: 'assets/images/diabliss.png',
  ),
  DiabetesSpecialist(
    name: 'Sugar Free Gold',
    price: 30,
    imagePath: 'assets/images/sugar.png',
  ),
  DiabetesSpecialist(
    name: 'Sugar Free',
    price: 25,
    imagePath: 'assets/images/s_free.png',
  ),
  DiabetesSpecialist(
    name: 'Metmorphin',
    price: 25,
    imagePath: 'assets/images/metmorphin.png',
  ),
  DiabetesSpecialist(
    name: 'Metmorphin',
    price: 25,
    imagePath: 'assets/images/met.png',
  ),
  DiabetesSpecialist(
    name: 'Diabecon DS',
    price: 25,
    imagePath: 'assets/images/diabec.png',
  ),
  DiabetesSpecialist(
    name: 'Sugarrid',
    price: 25,
    imagePath: 'assets/images/sugarid.png',
  ),
  DiabetesSpecialist(
    name: 'Gluconorm',
    price: 25,
    imagePath: 'assets/images/gluca.png',
  ),
  DiabetesSpecialist(
    name: 'Sugar Free Gold',
    price: 30,
    imagePath: 'assets/images/sugar.png',
  ),
  DiabetesSpecialist(
    name: 'Sugar Free',
    price: 25,
    imagePath: 'assets/images/s_free.png',
  ),
];
