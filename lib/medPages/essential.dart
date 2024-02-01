import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Essentials extends StatefulWidget {
  const Essentials({Key? key}) : super(key: key);

  @override
  State<Essentials> createState() => _EssentialsState();
}

class _EssentialsState extends State<Essentials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Find your Essentials',
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
                        hintText: 'Search for essentials...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Popular Essentials',
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
                itemCount: essentialsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return EssentialsCard(essential: essentialsData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EssentialsCard extends StatefulWidget {
  final Essential essential;

  EssentialsCard({required this.essential});

  @override
  _EssentialsCardState createState() => _EssentialsCardState();
}

class _EssentialsCardState extends State<EssentialsCard> {
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
                  widget.essential.imagePath,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            widget.essential.name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.0),
          Text(
            '${indianCurrencyFormat.format(widget.essential.price)}',
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
                  builder: (context) => Essentials(),
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

class Essential {
  final String name;
  double price;
  final String imagePath;

  Essential({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

final List<Essential> essentialsData = [
  Essential(
    name: 'Hand Sanitizer',
    price: 20,
    imagePath: 'assets/images/c2.png',
  ),
  Essential(
    name: 'Face Mask',
    price: 30,
    imagePath: 'assets/images/c1.png',
  ),
  Essential(
    name: 'Disinfectant Spray',
    price: 25,
    imagePath: 'assets/images/c3.png',
  ),
  Essential(
    name: 'Hand Gloves',
    price: 20,
    imagePath: 'assets/images/c4.png',
  ),
  Essential(
    name: 'Cleaning Wipes',
    price: 20,
    imagePath: 'assets/images/c4.png',
  ),
];
