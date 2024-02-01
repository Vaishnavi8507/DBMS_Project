import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../cartPage/fitnessCart.dart'; // Update the import statement

class Fitness extends StatefulWidget {
  const Fitness({Key? key}) : super(key: key);

  @override
  State<Fitness> createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Find your Fitness Specialists', // Updated title
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
                            'Search for fitness specialists...', // Updated hint text
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Popular Fitness Products', // Updated heading
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
                itemCount:
                    fitnessSpecialistsData.length, // Updated variable name
                itemBuilder: (BuildContext context, int index) {
                  return FitnessCard(
                      specialist: fitnessSpecialistsData[
                          index]); // Updated variable name
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FitnessCard extends StatefulWidget {
  final FitnessSpecialist specialist; // Updated class name

  FitnessCard({required this.specialist});

  @override
  _FitnessCardState createState() => _FitnessCardState();
}

class _FitnessCardState extends State<FitnessCard> {
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
                  builder: (context) =>
                      FitnessCart(), // Updated import statement
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

class FitnessSpecialist {
  // Updated class name
  final String name;
  double price;
  final String imagePath;

  FitnessSpecialist({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

final List<FitnessSpecialist> fitnessSpecialistsData = [
  FitnessSpecialist(
    name: 'Protein Powder',
    price: 20,
    imagePath: 'assets/images/fit3.png',
  ),
  FitnessSpecialist(
    name: 'Pre-Workout Supplement',
    price: 30,
    imagePath: 'assets/images/fit3.png',
  ),
  FitnessSpecialist(
    name: 'Fitness Tracker',
    price: 25,
    imagePath: 'assets/images/fit2.png',
  ),
  FitnessSpecialist(
    name: 'Yoga Mat',
    price: 25,
    imagePath: 'assets/images/fit1.png',
  ),
];
