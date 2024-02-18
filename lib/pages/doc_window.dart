import 'package:flutter/material.dart';

class DoctorWindow extends StatefulWidget {
  // Add variables to store user details
  final String name;
  final String availability;
  final String specialization;

  const DoctorWindow({
    Key? key,
    required this.name,
    required this.specialization,
    required this.availability,
  }) : super(key: key);

  @override
  State<DoctorWindow> createState() => _DoctorWindowState();
}

class _DoctorWindowState extends State<DoctorWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Doctor Dashboard',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image, user details, and three small containers
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image and user details
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        Image.asset(
                          'assets/images/doc1.png', // Path to your image asset
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 20),
                        // User details
                        Text(
                          'Welcome, ${widget.name}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Specialization: ${widget.specialization}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Availability: ${widget.availability}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  // Three small containers
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          buildInfoContainer(
                            iconPath: 'assets/images/patient.png',
                            label: 'Total Patient',
                            value: '1500',
                          ),
                          SizedBox(width: 20),
                          buildInfoContainer(
                            iconPath: 'assets/images/patient.png',
                            label: 'Total Patient',
                            value: '1500',
                          ),
                          SizedBox(width: 20),
                          buildInfoContainer(
                            iconPath: 'assets/images/apo.png',
                            label: 'Appointments',
                            value: '1000',
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Text for Patient Appointment
                      Text(
                        'Patient Appointment',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Container for appointment section
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Image')),
                    DataColumn(label: Text('Patient Name')),
                    DataColumn(label: Text('App Date')),
                    DataColumn(label: Text('Purpose')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(
                        Image.asset(
                          'assets/images/patient.png', // Path to patient image
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      DataCell(Text('John Doe')),
                      DataCell(Text('2024-02-18')),
                      DataCell(Text('Consultation')),
                      DataCell(Text('New')),
                      DataCell(Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Action for accept button
                            },
                            child: Text('Accept'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Action for postpone button
                            },
                            child: Text('Postpone'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Action for cancel button
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      )),
                    ]),
                    // Add more rows if needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoContainer({
    required String iconPath,
    required String label,
    required String value,
  }) {
    return Container(
      height: 80,
      width: 200,
      color: Colors.grey.shade200,
      child: Row(
        children: [
          SizedBox(width: 10),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(iconPath),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
