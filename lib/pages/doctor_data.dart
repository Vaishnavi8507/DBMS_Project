// doctors_data.dart

class Doctor {
  final String name;
  final String bio;
  final String specialization;
  final String imagePath;
  final double rating;
  final String experience;
  final String center;
  final String availability;
  final double price;

  Doctor(this.name, this.specialization, this.imagePath, this.rating,
      this.experience, this.bio, this.center, this.availability, this.price);
}

List<Doctor> doctorsData = [
  Doctor(
    'Dr. Tsunade',
    'Cardiologist',
    'assets/images/doc1.png',
    4.5,
    '5+years',
    'Completed Masters in certified university',
    'MediCare Hospital',
    '10 AM-2 PM',
    600,
  ),
  Doctor(
    'Dr. Hatake Kakashi',
    'Dentist',
    'assets/images/doc2.png',
    4.2,
    '6+years',
    'Completed Masters in certified university',
    'MedTech Care',
    '11 AM- 2 PM',
    500,
  ),
  Doctor(
    'Dr. Sakura',
    'Orthopedic Surgeon',
    'assets/images/doc3.png',
    4.8,
    '7+years',
    'Completed Masters in certified university',
    'DocPark',
    '11 AM- 1 PM',
    550,
  ),
  Doctor(
    'Dr. Temari',
    'Neurologist',
    'assets/images/doc4.png',
    4.5,
    '9+years',
    'Completed Masters in certified university',
    'Appollo Hospital',
    '4 PM- 8 PM',
    650,
  ),
  Doctor(
    'Dr. Tenten',
    'Therapist',
    'assets/images/doc5.png',
    4.2,
    '6+years',
    'Completed Masters in certified university',
    'DRM Hospital',
    '6 PM- 9 PM',
    450,
  ),
  Doctor(
      'Dr. Shikamaru',
      'General Physician',
      'assets/images/doc1.png',
      4.8,
      '6+years',
      'Completed Masters in certified university',
      'Brindavan Hospital',
      '3 PM- 7 PM',
      500),
  Doctor(
      'Dr Kisame',
      'Ortho',
      'assets/images/doc3.png',
      4.2,
      '3+years',
      'Completed Masters in certified university',
      'Agarwal Hospital',
      '5 PM - 8 PM',
      600),
];
List<Doctor> SquareDoctorData = [
  Doctor(
      'Dr. Yamato',
      'Cardiologist',
      'assets/images/doc3.png',
      4.2,
      '5 years',
      'Completed Masters in certified university',
      'Agarwal Hospital',
      '5 PM - 8 PM',
      500),
  Doctor(
      'Dr. Kisame',
      'Cardiologist',
      'assets/images/doc4.png',
      3.9,
      '7 years',
      'Completed Masters in certified university',
      'Brindavan Hospital',
      '3 PM- 7 PM',
      400),
  Doctor(
      'Dr. Byakuya',
      'Cardiologist',
      'assets/images/doc2.png',
      4.1,
      '11 years',
      'Completed Masters in certified university',
      'Agarwal Hospital',
      '5 PM - 8 PM',
      500),
  Doctor(
      'Dr. Neir',
      'Cardiologist',
      'assets/images/doc1.png',
      3.9,
      '8 years',
      'Completed Masters in certified university',
      'Agarwal Hospital',
      '5 PM - 8 PM',
      600),
  Doctor(
      'Dr. Orochimaro',
      'Cardiologist',
      'assets/images/doc5.png',
      4.3,
      '13 years',
      'Completed Masters in certified university',
      'Brindavan Hospital',
      '3 PM- 7 PM',
      500),
  Doctor(
      'Dr. Orochimaro',
      'Cardiologist',
      'assets/images/doc5.png',
      4.3,
      '13 years',
      'Completed Masters in certified university',
      'Agarwal Hospital',
      '5 PM - 8 PM',
      600),
];
