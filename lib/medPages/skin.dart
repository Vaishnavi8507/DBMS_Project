import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../cartPage/skinCart.dart';

class Skin extends StatefulWidget {
  const Skin({Key? key}) : super(key: key);

  @override
  State<Skin> createState() => _SkinState();
}

class _SkinState extends State<Skin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Find your Skin Specialists',
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
                        hintText:
                            'Search for skin specialists...', // Updated hint text
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Popular Skin Products', // Updated heading
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
                  crossAxisCount: 5,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: skinSpecialistsData.length, // Updated variable name
                itemBuilder: (BuildContext context, int index) {
                  return SkinCard(
                      specialist:
                          skinSpecialistsData[index]); // Updated variable name
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkinCard extends StatefulWidget {
  final SkinSpecialist specialist; // Updated class name

  SkinCard({required this.specialist});

  @override
  _SkinCardState createState() => _SkinCardState();
}

class _SkinCardState extends State<SkinCard> {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SkinCart(), // Updated import statement
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

class SkinSpecialist {
  // Updated class name
  final String name;
  double price;
  final String imagePath;

  SkinSpecialist({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

final List<SkinSpecialist> skinSpecialistsData = [
  SkinSpecialist(
    name: 'Moisturizing Cream',
    price: 20,
    imagePath: 'assets/images/cream1.png',
  ),
  SkinSpecialist(
    name: 'Lamer Moisturizer',
    price: 30,
    imagePath: 'assets/images/cream2.png',
  ),
  SkinSpecialist(
    name: 'Vaseline Body Lotion',
    price: 25,
    imagePath: 'assets/images/cream11.png',
  ),
  SkinSpecialist(
    name: 'Novaclear',
    price: 25,
    imagePath: 'assets/images/cream9.png',
  ),
  SkinSpecialist(
    name: 'Minimalist Moisturizer',
    price: 25,
    imagePath: 'assets/images/cream7.png',
  ),
  SkinSpecialist(
    name: 'Olay Moisturizing Cream',
    price: 20,
    imagePath: 'assets/images/cream4.png',
  ),
  SkinSpecialist(
    name: 'Himalaya Face Wash',
    price: 20,
    imagePath: 'assets/images/f1.png',
  ),
  SkinSpecialist(
    name: 'Plum Green Tea ',
    price: 30,
    imagePath: 'assets/images/f3.png',
  ),
  SkinSpecialist(
    name: 'm Caffeine',
    price: 25,
    imagePath: 'assets/images/f4.png',
  ),
  SkinSpecialist(
    name: 'CeraVe',
    price: 25,
    imagePath: 'assets/images/cream3.png',
  ),
  SkinSpecialist(
    name: 'Vitamin C Serum',
    price: 25,
    imagePath: 'assets/images/f5.png',
  ),
  SkinSpecialist(
    name: 'Anti-Aging Serum',
    price: 20,
    imagePath: 'assets/images/f6.png',
  ),
  SkinSpecialist(
    name: 'Plum Green Tea ',
    price: 30,
    imagePath: 'assets/images/f3.png',
  ),
  SkinSpecialist(
    name: 'Lamer Moisturizer',
    price: 30,
    imagePath: 'assets/images/cream2.png',
  ),
  SkinSpecialist(
    name: 'Vitamin C Serum',
    price: 25,
    imagePath: 'assets/images/f5.png',
  ),
];
