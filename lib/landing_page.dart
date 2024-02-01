import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeb/pages/doctors_page.dart';
import 'package:weeb/src/Footer.dart';
import 'package:weeb/src/Header.dart';
import 'package:weeb/src/InfoPalette.dart';
import 'package:weeb/src/ProfileImage.dart';
import 'package:weeb/src/ProfileTile.dart';
import 'package:weeb/src/TestimonialTile.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ScrollController _controller;
  double pixels = 0.0;
  //var db = new MySql();

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        pixels = _controller.position.pixels;
        print(_controller.position.pixels);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 600.0,
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Transform(
                              transform: Matrix4.rotationZ(pi / 6)
                                ..translate(-180.0, 170.0),
                              child: Container(
                                height: 350.0,
                                width: 700.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(300.0),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 200.0,
                              left: 100.0,
                              child: Container(
                                height: 400.0,
                                width: 400.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your Path to Health and Happiness',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 38.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'begins with a click.',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      width: 300.0,
                                      child: Text(
                                        'This app revolutionizes healthcare accessibility by streamlining the appointment process.Access real-time availability of healthcare professionals, choose convenient time slots, and book appointment with a  few taps!',
                                        style: GoogleFonts.nunito(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 600.0,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ProfileImage(
                              top: 140.0,
                              left: 90.0,
                              diameter: 200.0,
                              image:
                                  'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                            ProfileImage(
                                top: 160.0,
                                left: 310.0,
                                diameter: 100.0,
                                image:
                                    'https://images.unsplash.com/photo-1579684385127-1ef15d508118?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                            ProfileImage(
                              top: 275.0,
                              left: 280.0,
                              diameter: 280.0,
                              image:
                                  'https://images.unsplash.com/photo-1584118624012-df056829fbd0?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                            ProfileImage(
                              top: 360.0,
                              left: 90.0,
                              diameter: 170.0,
                              image:
                                  'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?q=80&w=1779&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

                              // 'https://images.unsplash.com/photo-1584118624012-df056829fbd0?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                            ProfileTile(
                              top: 380.0,
                              left: 50.0,
                              title: 'Lets take care of ourselves',
                              subTitle: 'Hospital',
                              factor: 0.5,
                            ),
                            ProfileTile(
                              top: 140.0,
                              left: -10.0,
                              title: 'We gonna provide the best treatment',
                              subTitle: 'Tsunade',
                              factor: 0.9,
                            ),
                            ProfileTile(
                              top: 160.0,
                              left: 380.0,
                              title: 'We stand out for you',
                              subTitle: 'Kakashi',
                              factor: 0.4,
                            ),
                            ProfileTile(
                              top: 270.0,
                              left: 440.0,
                              title: 'Let us fight together',
                              subTitle: 'Might Guy ',
                              factor: 1.1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Header(),
                ],
              ),
              Container(
                height: 400.0,
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      right: -200.0,
                      child: Container(
                        height: 330.0,
                        width: 430.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(300.0),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Our Services',
                          style: GoogleFonts.nunito(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AnimatedOpacity(
                              opacity: pixels >= 100 ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 500),
                              child: AnimatedPadding(
                                duration: Duration(milliseconds: 500),
                                padding: EdgeInsets.only(
                                    left: pixels >= 100 ? 0.0 : 500.0),
                                child: InfoPalette(
                                  title: 'Book your appointment',
                                  text:
                                      'Communicate with doctors, search them, find a convenient slot for yourself.',
                                  icon: Icons.mark_unread_chat_alt_sharp,
                                ),
                              ),
                            ),
                            InfoPalette(
                              title: 'Health Record Access',
                              text:
                                  'Track your progress thanks to the medical support right inside the platform.',
                              icon: Icons.pie_chart_rounded,
                            ),
                            InfoPalette(
                              title: 'Home Remedies',
                              text: 'Cure your diseases at home',
                              icon: Icons.severe_cold,
                            ),
                            InfoPalette(
                              title: 'Medicinal Stock',
                              text: 'Manage hustle free buying of tablets',
                              icon: Icons.medical_services_sharp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black87,
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 8.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              border: Border.all(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            child: Text(
                              'Explore More',
                              style: GoogleFonts.nunito(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 500.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -250.0,
                      child: Container(
                        height: 450.0,
                        width: 700.0,
                        decoration: BoxDecoration(
                          color: Colors.amber[400],
                          borderRadius: BorderRadius.circular(400.0),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      top: 20.0,
                      left: pixels >= 500 ? 100.0 : 0.0,
                      child: Container(
                        height: 400.0,
                        width: 700.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          'data:image/jpeg;base64,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',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ProfileTile(
                      left: 80.0,
                      top: -10.0,
                      title: 'Send a request to the concerned doctor!',
                      subTitle: 'Your well-wisher',
                      factor: 1.0,
                    ),
                    ProfileTile(
                      left: 620.0,
                      top: 400.0,
                      title: 'Book your slots whenever you want',
                      subTitle: 'Support team',
                      factor: 1.0,
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      right: pixels >= 600 ? 100.0 : 0.0,
                      top: 150.0,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: pixels >= 600 ? 1.0 : 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Appointment at your fingertips',
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w800,
                                fontSize: 25.0,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              width: 280.0,
                              child: Text(
                                'Manage your appointment, Organize your own med-space, keep statistics and collaboration with helthcare at one place',
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                backgroundColor: Colors.grey[900],
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50.0,
                                  vertical: 20.0,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doctors()));
                              },
                              child: Text(
                                'Try for free',
                                style: GoogleFonts.nunito(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 600.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      child: Column(
                        children: [
                          Text(
                            'Why Choose Us?',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w800,
                              fontSize: 25.0,
                            ),
                          ),
                          Text(
                            'Choosing us offers a multitude of benefits that sets us apart in the healthcare technology landscape.Our platform provides an intuitive and user-friendly interface for patients, ensuring a seamless experience',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedAlign(
                      duration: Duration(milliseconds: 500),
                      alignment: pixels >= 1200
                          ? Alignment(0.0, 0.0)
                          : Alignment(-0.2, 0.0),
                      child: AnimatedOpacity(
                        opacity: pixels >= 1200 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: -70.0,
                                    top: -60.0,
                                    child: Icon(
                                      Icons.format_quote,
                                      color: Colors.grey[300],
                                      size: 150.0,
                                    ),
                                  ),
                                  Text(
                                    'Excellent Support',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: 360.0,
                                child: Text(
                                  'We ensure our service seekers to get the best service and support from our end',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Comment detail',
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.0,
                                ),
                              ),
                              Container(
                                height: 1.5,
                                width: 100.0,
                                color: Colors.black87,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TestimonialTile(
                      image:
                          'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      left: 780.0,
                      top: pixels >= 1000 ? 100.0 : 130.0,
                      leftalign: false,
                    ),
                    TestimonialTile(
                      image:
                          'https://images.unsplash.com/photo-1628348070889-cb656235b4eb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      left: 840.0,
                      top: pixels >= 1200 ? 400.0 : 430.0,
                      leftalign: false,
                    ),
                    TestimonialTile(
                      image:
                          'https://plus.unsplash.com/premium_photo-1675807263788-5708e2bffdb5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      left: 440.0,
                      top: pixels >= 1300 ? 450.0 : 480.0,
                      leftalign: true,
                    ),
                    Positioned(
                      right: 350.0,
                      top: 200.0,
                      child: Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.red[600],
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20.0,
                              offset: Offset(0.0, 10.0),
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 200.0,
                      top: 250.0,
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20.0,
                              offset: Offset(0.0, 10.0),
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 250.0,
                      top: 450.0,
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          color: Color(0xff373e98),
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20.0,
                              offset: Offset(0.0, 10.0),
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 600.0,
                color: Color(0xff373e98),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedAlign(
                      duration: Duration(milliseconds: 500),
                      alignment: pixels >= 1600
                          ? Alignment(0.0, 1.0)
                          : Alignment(-0.2, 1.0),
                      child: AnimatedOpacity(
                        opacity: pixels >= 1600 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Container(
                          height: 600.0,
                          width: 400.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 80.0,
                              ),
                              Text(
                                'Get Started Today',
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.0,
                                  fontSize: 35.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'Join our community',
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      onPressed: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 30.0,
                                          vertical: 12.0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Text(
                                          'Subscription',
                                          style: GoogleFonts.josefinSans(
                                            color: Color(0xff373e98),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      //color: Colors.white,
                                      padding: EdgeInsets.all(0.0),
                                    ),
                                    onPressed: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30.0,
                                        vertical: 12.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Text(
                                        'Try for free',
                                        style: GoogleFonts.josefinSans(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: Footer(),
                    ),
                    Align(
                      alignment: Alignment(1.18, 0.0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.amber[400],
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
