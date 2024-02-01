import 'package:flutter/material.dart';
import 'package:weeb/pages/pay_page.dart';

class AppointmentPage extends StatefulWidget {
  final String doctorName;
  final String bio;
  final String specialization;
  final double price;
  final String imagePath;
  final double rating;
  final String experience;
  final String availability;
  final String center;

  AppointmentPage({
    required this.doctorName,
    required this.bio,
    required this.specialization,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.experience,
    required this.availability,
    required this.center,
  });

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage: AssetImage(widget.imagePath),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      widget.doctorName,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.person_outline),
                        SizedBox(width: 5),
                        Text(
                          'Bio: ${widget.bio}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.medical_services),
                        SizedBox(width: 8.0),
                        Text(
                          'Specialization: ${widget.specialization}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 8.0),
                        Text(
                          'Consultation Fee: ${widget.price}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(width: 8.0),
                        Text(
                          'Ratings: ${widget.rating} stars',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 8.0),
                        Text(
                          'Experience: ${widget.experience}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(width: 8.0),
                        Text(
                          'Availability: ${widget.availability}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.place),
                        SizedBox(width: 8.0),
                        Text(
                          'Center: ${widget.center}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 600.0,
              margin: EdgeInsets.only(left: 8),
              padding: EdgeInsets.all(15.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/book_slot.jpg',
                    width: 500,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Choose Your Slot',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select Date'),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () => _selectTime(context),
                        child: Text('Select Time'),
                      ),
                    ],
                  ),
                  if (selectedDate != null)
                    Text('Selected Date: ${selectedDate!.toLocal()}'),
                  if (selectedTime != null)
                    Text(
                      'Selected Time: ${selectedTime!.format(context)}',
                    ),
                  SizedBox(height: 18),
                  ElevatedButton(
                      onPressed: () {
                        if (selectedDate == null || selectedTime == null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      'Oops you have not choosen booking details.'),
                                  content: Text(
                                      'Please select booking date and time'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentPage(
                                        doctorName: widget.doctorName,
                                        specialization: widget.specialization,
                                        imagePath: widget.imagePath,
                                        location: widget.center,
                                        consultationFee: widget.price,
                                        bookedDate:
                                            selectedDate!.toLocal().toString(),
                                        bookedTime:
                                            selectedTime!.format(context),
                                      )));
                        }
                      },
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.deepPurpleAccent),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
