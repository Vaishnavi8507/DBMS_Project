import 'package:flutter/material.dart';
import 'package:weeb/pages/pharmFooter.dart';

import '../medPages/child.dart';
import '../medPages/diabetes.dart';
import '../medPages/drinks.dart';
import '../medPages/essential.dart';
import '../medPages/fitness.dart';
import '../medPages/skin.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthSync Hub',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Pharmacy(),
    );
  }
}

Widget _buildAvatar(String imagePath, String labelText) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(imagePath),
      ),
      SizedBox(width: 8.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star_half, color: Colors.yellow),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            labelText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ],
  );
}

class Pharmacy extends StatefulWidget {
  @override
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset > 0) {
          if (!_animationController.isAnimating &&
              !_animationController.isCompleted) {
            _animationController.forward();
          }
        } else {
          if (!_animationController.isAnimating &&
              _animationController.isCompleted) {
            _animationController.reverse();
          }
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: CustomAppBar(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomContainer(),
                SizedBox(height: 50),
                Container(
                  height: 400,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/tab.png',
                        width: 550,
                        height: 650,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '100% Trusted Medical Store',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Healthy Life',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Quality Products for you',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Hustle Free Order',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Best Offers & Coupons',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'At your doorsteps',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 45),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      width: 220,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/free_ship.png'),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Free Shipping',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      width: 220,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/secure_pay.png'),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Secure Payment',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      width: 220,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/call_sup.png'),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Support',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      width: 220,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/ref.png'),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Refund',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 55),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xff04289d),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/float.png',
                        width: 400,
                        height: 500,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildAvatar(
                                'assets/images/doc1.png',
                                'The HealthSync Hub has been a game-changer for me. Ordering my medications is a breeze, and the detailed\n'
                                    ' information provided helps me make informed decisions about my health.',
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Vaish',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15),
                              _buildAvatar(
                                'assets/images/doc1.png',
                                'The convenience of having my medications delivered to my doorstep is unparalleled. The security measures instill\n'
                                    ' confidence in every transaction.',
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Ap',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15),
                              _buildAvatar(
                                'assets/images/doc1.png',
                                'As a busy professional, the efficient service has saved me countless hours. The ability to chat with a pharmacist\n'
                                    'online for quick advice is fantastic, making it so much easier to manage my health.',
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Rohit',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15),
                              _buildAvatar(
                                'assets/images/doc1.png',
                                'As a busy professional, the efficient service has saved me countless hours. The ability to chat with a pharmacist\n'
                                    'online for quick advice is fantastic, making it so much easier to manage my health.',
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Vaish',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                PharmFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          HealthSyncHubText(),
          SizedBox(width: 20.0),
          SearchContainer(),
          SizedBox(width: 20.0),
          CartIcon(),
        ],
      ),
    );
  }
}

class HealthSyncHubText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.dashboard,
          color: Colors.blue,
          size: 30.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          'HealthSync',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Hub',
          style: TextStyle(
            color: Colors.green,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SearchContainer extends StatefulWidget {
  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  TextEditingController _searchController = TextEditingController();
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 900,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: _isFocused ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  setState(() {
                    _isFocused = true;
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    _isFocused = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_cart),
      onPressed: () {},
    );
  }
}

class CustomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            constraints: BoxConstraints(maxHeight: 280),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffbd59f7), Color(0xff3725fa)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From the Leading Online Pharmacy ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '& HealthCare Platform Company',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Essential Nutrition and Supplements from all over the suppliers around the world',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                TweenAnimationBuilder(
                  duration: Duration(seconds: 1),
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'assets/images/pharmacy-img.png',
                    // fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Top Picks For You',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: HoverImageWidget(
                    image: 'assets/images/med8.png',
                    text: 'Diabetes',
                    imageSize: 120.0,
                  ),
                ),
                SizedBox(width: 45.0),
                HoverImageWidget(
                  image: 'assets/images/med4.png',
                  text: 'Skin Care',
                  imageSize: 130.0,
                ),
                SizedBox(width: 45.0),
                HoverImageWidget(
                  image: 'assets/images/med5.png',
                  text: 'Child Care',
                  imageSize: 130.0,
                ),
                SizedBox(width: 45.0),
                HoverImageWidget(
                  image: 'assets/images/med9.png',
                  text: 'Drinks & Supplements',
                  imageSize: 130.0,
                ),
                SizedBox(width: 45.0),
                HoverImageWidget(
                  image: 'assets/images/fitness.jpg',
                  text: 'Fitness',
                  imageSize: 130.0,
                ),
                SizedBox(width: 45.0),
                HoverImageWidget(
                  image: 'assets/images/covid.png',
                  text: 'Covid Essentials',
                  imageSize: 130.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 45.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 500,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Cash On Delivery Available',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 1.0),
                    Text(
                      'Order Now, Pay Later',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle order now button press
                      },
                      icon: Icon(Icons.shopping_cart),
                      label: Text('Order Now'),
                    ),
                  ],
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Great Deals',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      'Get 20% Off on your first purchase',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0), // Add spacing
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle order now button press
                      },
                      icon: Icon(Icons.shopping_cart),
                      label: Text('View Medicines'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HoverImageWidget extends StatefulWidget {
  final String image;
  final String text;
  final double imageSize;

  HoverImageWidget(
      {required this.image, required this.text, required this.imageSize});

  @override
  _HoverImageWidgetState createState() => _HoverImageWidgetState();
}

class _HoverImageWidgetState extends State<HoverImageWidget> {
  bool _isHovered = false;

  void _navigateToPage() {
    if (widget.text == 'Diabetes') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Diabetes()),
      );
    } else if (widget.text == 'Skin Care') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Skin()),
      );
    } else if (widget.text == 'Child Care') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BabyCare()),
      );
    } else if (widget.text == 'Covid Essentials') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Essentials()),
      );
    } else if (widget.text == 'Fitness') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Fitness()),
      );
    } else if (widget.text == 'Drinks & Supplements') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Drinks()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return InkWell(
          onTap: _navigateToPage,
          onHover: (isHovered) {
            setState(() {
              _isHovered = isHovered;
            });
          },
          child: Column(
            children: [
              Container(
                width: widget.imageSize,
                height: widget.imageSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ]
                      : [],
                ),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
