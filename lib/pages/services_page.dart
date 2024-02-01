import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Services',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double hexagonWidth = constraints.maxWidth / 5;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(height: 3),
                      Text(
                        'Speciality',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 100 * (1 - _animation.value)),
                        child: Opacity(
                          opacity: _animation.value,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                HexagonContainer(
                                  icon: FontAwesomeIcons.heart,
                                  text: 'Cardiology',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.deepPurple,
                                    Colors.red,
                                  ],
                                ),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.brain,
                                  text: 'Neurology',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.deepPurple,
                                    Colors.red,
                                  ],
                                ),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.tooth,
                                  text: 'Dentistry',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.deepPurple,
                                    Colors.red,
                                  ],
                                ),
                                SizedBox(width: 4),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.bone,
                                  text: 'Orthopedic',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.deepPurple,
                                    Colors.red,
                                  ],
                                ),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.hospital,
                                  text: 'Therapist',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.deepPurple,
                                    Colors.red,
                                  ],
                                ),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.userMd,
                                  text: 'General Physician',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.deepPurple,
                                    Colors.red,
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Remedies',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 100 * (1 - _animation.value)),
                        child: Opacity(
                          opacity: _animation.value,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                HexagonContainer(
                                  icon: FontAwesomeIcons.apple,
                                  text: 'Healthy Diet',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.pinkAccent,
                                    Colors.deepPurple,
                                  ],
                                ),
                                SizedBox(width: 8),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.running,
                                  text: 'Exercise',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.pinkAccent,
                                    Colors.deepPurple,
                                  ],
                                ),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.bed,
                                  text: 'Adequate Sleep',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.pinkAccent,
                                    Colors.deepPurple,
                                  ],
                                ),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.stethoscope,
                                  text: 'Consult a Doctor',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.pinkAccent,
                                    Colors.deepPurple,
                                  ],
                                ),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.userNurse,
                                  text: 'Nursing Care',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.pinkAccent,
                                    Colors.deepPurple,
                                  ],
                                ),
                                HexagonContainer(
                                  icon: FontAwesomeIcons.medkit,
                                  text: 'Medication',
                                  width: hexagonWidth,
                                  gradientColors: [
                                    Colors.pinkAccent,
                                    Colors.deepPurple,
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Hexagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    final path = Path();
    path.moveTo(centerX + size.width / 4, centerY);

    for (int i = 1; i <= 6; i++) {
      double theta = (2.0 * pi / 6) * i;
      double x = centerX + size.width / 4 * cos(theta);
      double y = centerY + size.width / 4 * sin(theta);
      path.lineTo(x, y);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HexagonContainer extends StatefulWidget {
  final IconData icon;
  final String text;
  final double width;
  final List<Color> gradientColors;

  HexagonContainer({
    Key? key,
    required this.icon,
    required this.text,
    required this.width,
    required this.gradientColors,
  }) : super(key: key);

  @override
  _HexagonContainerState createState() => _HexagonContainerState();
}

class _HexagonContainerState extends State<HexagonContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.width,
      child: ClipPath(
        clipper: Hexagon(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.gradientColors,
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          margin: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                widget.icon,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(height: 8),
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
