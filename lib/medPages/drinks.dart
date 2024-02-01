import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../cartPage/drinkCart.dart';

class Drinks extends StatefulWidget {
  const Drinks({Key? key}) : super(key: key);

  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Find your Drinks Specialists',
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black45),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for drinks specialists...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Popular Drinks',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // Adjust the number of items per row
                  crossAxisSpacing: 16.0, // Adjust the spacing between items
                  mainAxisSpacing: 16.0, // Adjust the spacing between rows
                ),
                itemCount: drinksSpecialistsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return DrinksCard(specialist: drinksSpecialistsData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrinksCard extends StatefulWidget {
  final DrinksSpecialist specialist;

  DrinksCard({required this.specialist});

  @override
  _DrinksCardState createState() => _DrinksCardState();
}

class _DrinksCardState extends State<DrinksCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final indianCurrencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹');
    return Container(
      width: 180.0, // Adjust the width of the container as needed
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
              // Navigate to another page when Add to Cart is clicked
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrinkCart(),
                ),
              );
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

class DrinksSpecialist {
  final String name;
  double price;
  final String imagePath;

  DrinksSpecialist({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

final List<DrinksSpecialist> drinksSpecialistsData = [
  DrinksSpecialist(
    name: 'B Protein',
    price: 20,
    imagePath: 'assets/images/prot4.webp',
  ),
  DrinksSpecialist(
    name: 'Whey Protein',
    price: 30,
    imagePath: 'assets/images/prot2.webp',
  ),
  DrinksSpecialist(
    name: "Women's Protein",
    price: 25,
    imagePath: 'assets/images/prot1.webp',
  ),
  DrinksSpecialist(
    name: 'Whey Protein',
    price: 25,
    imagePath: 'assets/images/prot3.webp',
  ),
  DrinksSpecialist(
    name: 'Pro 360 Classic',
    price: 25,
    imagePath: 'assets/images/prot5.png',
  ),
  DrinksSpecialist(
    name: 'Vegan Protein',
    price: 20,
    imagePath: 'assets/images/prot7.webp',
  ),
  DrinksSpecialist(
    name: 'B Protein',
    price: 20,
    imagePath: 'assets/images/prot4.webp',
  ),
  DrinksSpecialist(
    name: 'Whey Protein',
    price: 30,
    imagePath: 'assets/images/prot2.webp',
  ),
  DrinksSpecialist(
    name: "Women's Protein",
    price: 25,
    imagePath: 'assets/images/prot1.webp',
  ),
  DrinksSpecialist(
    name: 'Whey Protein',
    price: 25,
    imagePath: 'assets/images/prot3.webp',
  ),
  DrinksSpecialist(
    name: 'Pro 360 Classic',
    price: 25,
    imagePath: 'assets/images/prot5.png',
  ),
  DrinksSpecialist(
    name: 'Vegan Protein',
    price: 20,
    imagePath: 'assets/images/prot7.webp',
  ),
  DrinksSpecialist(
    name: 'B Protein',
    price: 20,
    imagePath: 'assets/images/prot4.webp',
  ),
  DrinksSpecialist(
    name: 'Whey Protein',
    price: 30,
    imagePath: 'assets/images/prot2.webp',
  ),
  DrinksSpecialist(
    name: "Women's Protein",
    price: 25,
    imagePath: 'assets/images/prot1.webp',
  ),
];
