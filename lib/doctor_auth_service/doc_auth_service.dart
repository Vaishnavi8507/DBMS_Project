import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weeb/models/doctor_model.dart';

class DocAuthService {
  static const String uri =
      "http://localhost:3000"; // Update with your server URL

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> httpErrorHandle({
    required http.Response response,
    required BuildContext context,
    required Function onSuccess,
  }) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      onSuccess();
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final errorMessage = responseData['message'] ?? 'Something went wrong';
      showSnackBar(context, errorMessage);
    }
  }

  Future<void> signupDoctor({
    required BuildContext context,
    required String DoctorName,
    required DateTime Availability,
    required String Specialization,
    required String ContactNo,
    required String DoctorEmail,
    required String DoctorPassword,
  }) async {
    try {
      final Doctor doctor = Doctor(
        DoctorName: DoctorName,
        Availability: Availability,
        Specialization: Specialization,
        ContactNo: ContactNo,
        DoctorEmail: DoctorEmail,
        DoctorPassword: DoctorPassword,
      );

      final http.Response response = await http.post(
        Uri.parse('$uri/doctor/sign-up'),
        body: jsonEncode(doctor.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      await httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Doctor account created! Please login.');
        },
      );

      print(response.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signinDoctor({
    required BuildContext context,
    required String DoctorEmail,
    required String DoctorPassword,
  }) async {
    try {
      final http.Response res = await http.post(
        Uri.parse('$uri/doctor/login'),
        body: jsonEncode({
          "DoctorEmail": DoctorEmail,
          "DoctorPassword": DoctorPassword,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      await httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "You are now logged in as a Doctor!");
        },
      );

      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
