import 'package:flutter/material.dart';

import '../screens/booking.dart';
import 'doctor_data.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Find your Doctors',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                          hintText: 'Search for doctors...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Popular Doctors',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (Doctor doctor in doctorsData)
                      CircularDoctorCard(doctor: doctor),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text('Cardiologist'),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (Doctor doctor in SquareDoctorData)
                      SquareDoctorCard(doctor: doctor),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircularDoctorCard extends StatefulWidget {
  final Doctor doctor;

  CircularDoctorCard({required this.doctor});

  @override
  _CircularDoctorCardState createState() => _CircularDoctorCardState();
}

class _CircularDoctorCardState extends State<CircularDoctorCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      widget.doctor.imagePath,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                widget.doctor.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                widget.doctor.specialization,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16.0,
                  ),
                  Text(
                    widget.doctor.rating.toString(),
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              ),
              SizedBox(height: 4.0),
              if (isHovered)
                Container(
                  padding: EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _showDetailsPage();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: Text('Know More'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentPage(
          doctorName: widget.doctor.name,
          bio: widget.doctor.bio,
          specialization: widget.doctor.specialization,
          price: widget.doctor.price,
          imagePath: widget.doctor.imagePath,
          rating: widget.doctor.rating,
          experience: widget.doctor.experience,
          availability: widget.doctor.availability,
          center: widget.doctor.center,
        ),
      ),
    );
  }
}

class SquareDoctorCard extends StatefulWidget {
  final Doctor doctor;

  SquareDoctorCard({required this.doctor});

  @override
  _SquareDoctorCardState createState() => _SquareDoctorCardState();
}

class _SquareDoctorCardState extends State<SquareDoctorCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      widget.doctor.imagePath,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                widget.doctor.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                widget.doctor.specialization,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16.0,
                  ),
                  Text(
                    widget.doctor.rating.toString(),
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              ),
              if (isHovered)
                Container(
                  padding: EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _showDetailsPage();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: Text('Know More'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentPage(
          doctorName: widget.doctor.name,
          bio: widget.doctor.bio,
          specialization: widget.doctor.specialization,
          price: widget.doctor.price,
          imagePath: widget.doctor.imagePath,
          rating: widget.doctor.rating,
          experience: widget.doctor.experience,
          availability: widget.doctor.availability,
          center: widget.doctor.center,
        ),
      ),
    );
  }
}
