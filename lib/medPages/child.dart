import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weeb/cartPage/childCart.dart';

class BabyCare extends StatefulWidget {
  const BabyCare({Key? key}) : super(key: key);

  @override
  State<BabyCare> createState() => _BabyCareState();
}

class _BabyCareState extends State<BabyCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Find your BabyCare Specialists',
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
                            'Search for babycare specialists...', // Updated hint text
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Popular BabyCare Products', // Updated heading
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
                itemCount: babyCareSpecialistsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return BabyCareCard(
                      specialist: babyCareSpecialistsData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BabyCareCard extends StatefulWidget {
  final BabyCareSpecialist specialist;

  BabyCareCard({required this.specialist});

  @override
  _BabyCareCardState createState() => _BabyCareCardState();
}

class _BabyCareCardState extends State<BabyCareCard> {
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
                  builder: (context) => ChildCart(),
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

class BabyCareSpecialist {
  // Updated class name
  final String name;
  double price;
  final String imagePath;

  BabyCareSpecialist({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

final List<BabyCareSpecialist> babyCareSpecialistsData = [
  BabyCareSpecialist(
    name: 'Jhonson\s baby Shampoo',
    price: 20,
    imagePath: 'assets/images/b5.png',
  ),
  BabyCareSpecialist(
    name: 'Himalaya Baby Lotion',
    price: 30,
    imagePath: 'assets/images/b15.png',
  ),
  BabyCareSpecialist(
    name: 'Jhonson\s baby Oil',
    price: 25,
    imagePath: 'assets/images/b7.png',
  ),
  BabyCareSpecialist(
    name: 'Jhonson\s baby Powder',
    price: 25,
    imagePath: 'assets/images/b9.png',
  ),
  BabyCareSpecialist(
    name: 'Jhonson\s baby Soap',
    price: 20,
    imagePath: 'assets/images/b6.png',
  ),
  BabyCareSpecialist(
    name: 'Pampers',
    price: 25,
    imagePath: 'assets/images/b12.png',
  ),
  BabyCareSpecialist(
    name: 'Woodwards',
    price: 25,
    imagePath: 'assets/images/b14.png',
  ),
  BabyCareSpecialist(
    name: 'Wet Wipes',
    price: 25,
    imagePath: 'assets/images/b10.png',
  ),
  BabyCareSpecialist(
    name: 'PediaSure',
    price: 25,
    imagePath: 'assets/images/b1.png',
  ),
  BabyCareSpecialist(
    name: 'EnSure',
    price: 25,
    imagePath: 'assets/images/b2.png',
  ),
  BabyCareSpecialist(
    name: 'Cerelac',
    price: 25,
    imagePath: 'assets/images/b16.png',
  ),
  BabyCareSpecialist(
    name: 'Milk Powder',
    price: 25,
    imagePath: 'assets/images/b17.png',
  ),
  BabyCareSpecialist(
    name: 'Huggies',
    price: 25,
    imagePath: 'assets/images/b13.png',
  ),
  BabyCareSpecialist(
    name: 'Wet Wipes',
    price: 25,
    imagePath: 'assets/images/b11.png',
  ),
  BabyCareSpecialist(
    name: 'Jhonson\s baby Oil',
    price: 25,
    imagePath: 'assets/images/b8.png',
  ),
];
