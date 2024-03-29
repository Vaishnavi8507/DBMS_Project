import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeb/pages/appointments.dart';

import '../pages/about_page.dart';
import '../pages/doc_window.dart';
import '../pages/doctors_page.dart';
import '../pages/home_page.dart';
import '../pages/pharmacy_page.dart';
import '../pages/services_page.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String selectedRole = 'Doctor';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff373e98),
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Row(
              children: [
                Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'HealthSync Hub',
                  style:
                      GoogleFonts.nunito(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 190.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HeaderNav(
                selected: true,
                text: 'Home',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              SizedBox(
                width: 40.0,
              ),
              HeaderNav(
                selected: false,
                text: 'Doctors',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Doctors()));
                },
              ),
              SizedBox(
                width: 40,
              ),
              HeaderNav(
                selected: false,
                text: 'Services',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Services()));
                },
              ),
              SizedBox(
                width: 40,
              ),
              HeaderNav(
                selected: false,
                text: 'Pharmacy',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Pharmacy()));
                },
              ),
              SizedBox(
                width: 40,
              ),
              HeaderNav(
                selected: false,
                text: 'Appointments',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Appointments()));
                },
              ),
              SizedBox(width: 40),
              HeaderNav(
                selected: false,
                text: 'About Us',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
              ),
            ],
          ),
          SizedBox(
            width: 150.0,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  _showRoleSelectionDialog(context);
                },
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.nunito(
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 20.0,
                width: 1.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {
                  _showRoleSelectionDialog(context, isLogin: true);
                },
                child: Text(
                  'Log In',
                  style: GoogleFonts.nunito(
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showRoleSelectionDialog(BuildContext context, {bool isLogin = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isLogin ? 'Log In' : 'Sign Up'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (isLogin) {
                    _showLoginDialog(context);
                  } else {
                    _showSignUpPatientDialog(context);
                  }
                },
                child: Text('Patient'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (isLogin) {
                    _showLoginDialog(context);
                  } else {
                    _showSignUpDoctorDialog(context);
                  }
                },
                child: Text('Doctor'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSignUpPatientDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController dobController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Up as Patient'),
          content: SingleChildScrollView(
            child: Container(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Widgets for patient sign-up
                  _buildTextFieldWithIcon(
                    labelText: 'Name',
                    icon: Icons.person,
                    controller: nameController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Contact Number',
                    icon: Icons.phone,
                    controller: phoneController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Address',
                    icon: Icons.location_on,
                    controller: addressController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Date of Birth',
                    icon: Icons.calendar_today,
                    controller: dobController,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                print('Name: ${nameController.text}');
                print('Email: ${emailController.text}');
                print('Password: ${passwordController.text}');
                print('DOB: ${dobController.text}');
                print('Address: ${addressController.text}');
                print('Phone Number: ${phoneController.text}');

                // Handle patient sign-up logic
                Navigator.pop(context);
              },
              child: Text('Sign Up as Patient'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DoctorWindow(
                //               name: nameController.text,
                //               specialization: '',
                //               availability: '',
                //             )));
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showSignUpDoctorDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController contactNoController = TextEditingController();
    TextEditingController availabilityController = TextEditingController();
    TextEditingController specializationController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Up as Doctor'),
          content: SingleChildScrollView(
            child: Container(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Widgets for doctor sign-up
                  _buildTextFieldWithIcon(
                    labelText: 'Name',
                    icon: Icons.person,
                    controller: nameController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Contact Number',
                    icon: Icons.phone,
                    controller: contactNoController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Specialization',
                    icon: Icons.health_and_safety,
                    controller: specializationController,
                  ),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                    labelText: 'Availability',
                    icon: Icons.calendar_today,
                    controller: availabilityController,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String specialization = specializationController.text;
                String availability = availabilityController.text;
                if (selectedRole == 'Doctor') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorWindow(
                              name: name,
                              specialization: specialization,
                              availability: availability)));
                }

                // print('Name:${nameController.text}');
                // print('Email: ${emailController.text}');
                // print('Password: ${passwordController.text}');
                // print('Specialization:${specializationController.text}');
                // print('Availability:$availabilityController.text');
                // Handle patient sign-up logic
                // Navigator.pop(context);
              },
              child: Text('Sign Up as Doctor'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showLoginDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController availabilityController = TextEditingController();
    TextEditingController specializationController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log In'),
          content: SingleChildScrollView(
            child: Container(
              width: 350,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 250),
                      _buildTextFieldWithIcon(
                        labelText: 'Email',
                        icon: Icons.email,
                        controller: emailController,
                      ),
                      SizedBox(height: 10),
                      _buildTextFieldWithIcon(
                        labelText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        controller: passwordController,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (selectedRole == 'Doctor') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorWindow(
                                name: nameController.text,
                                specialization: specializationController.text,
                                availability: availabilityController.text,
                              )));
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text('Log In'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildTextFieldWithIcon({
  required String labelText,
  required IconData icon,
  required TextEditingController controller, // Add this parameter

  bool obscureText = false,
}) {
  return Container(
    height: 50,
    width: 350,
    padding: EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey),
      color: Colors.white,
    ),
    child: TextField(
      controller: controller, // Set the controller

      obscureText: obscureText,

      style: TextStyle(fontSize: 12),

      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          icon,
          color: Colors.blueGrey,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}

class HeaderNav extends StatefulWidget {
  final String text;

  final bool selected;

  final VoidCallback? onTap;

  HeaderNav({
    required this.selected,
    required this.text,
    this.onTap,
  });

  @override
  _HeaderNavState createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: GoogleFonts.nunito(
              fontSize: 13.0,
              color: Colors.white,
            ),
          ),
          widget.selected
              ? SizedBox(
                  height: 5.0,
                )
              : SizedBox(),
          widget.selected
              ? CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 2.0,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
