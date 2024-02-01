import 'package:flutter/material.dart';
import 'package:weeb/screens/my_appoint.dart';

class PaymentPage extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String imagePath;
  final String location;
  final double consultationFee;
  final String bookedDate;
  final String bookedTime;
  const PaymentPage({
    required this.specialization,
    required this.imagePath,
    required this.doctorName,
    required this.location,
    required this.consultationFee,
    required this.bookedDate,
    required this.bookedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500.0,
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Billing Details',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Phone',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Payment Method',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Name on Card',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Card Number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Expiry Year',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Additional Options',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/g_pay.jpg',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/phone_pe.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/paytm.png',
                          width: 55,
                          height: 55,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 40.0),
            Container(
              width: 500.0,
              padding: EdgeInsets.all(14.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Appointment Summary',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Image.asset(
                              imagePath,
                              width: 100,
                              height: 100,
                            ),
                            Text(
                              'Name: $doctorName',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              'Specialization: $specialization',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              'Consultation Fee: $consultationFee',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              'Booked Date: $bookedDate',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              'Booked Time: $bookedTime',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              'Location: $location',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              title: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/confirm.gif',
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Appointment booked Successfuly!!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              //     content: Text('Confirmed'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyAppointments(
                                                      doctorName: doctorName,
                                                      specialization:
                                                          specialization,
                                                      bookedTime: bookedTime,
                                                      imagePath: imagePath,
                                                      bookedDate: bookedDate)));
                                    },
                                    child: Text('Check')),
                              ],
                            );
                          });
                    },
                    child: Text('Confirm'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlinkingImage extends StatefulWidget {
  @override
  _BlinkingImageState createState() => _BlinkingImageState();
}

class _BlinkingImageState extends State<BlinkingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller.drive(Tween<double>(begin: 0.5, end: 1.0)),
      child: Image.asset(
        'assets/images/a_confirm.jpg',
        width: 250,
        height: 400,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
