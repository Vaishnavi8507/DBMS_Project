import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weeb/models/patient_model.dart';

class AuthService {
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
    if (response.statusCode == 200) {
      onSuccess();
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final errorMessage = responseData['message'] ?? 'Something went wrong';
      showSnackBar(context, errorMessage);
    }
  }

  //signup patient
  void signupPatient({
    required BuildContext context,
    required String patientName,
    required DateTime patientDOB,
    required String address,
    required String contactNo,
    required String patientEmail,
    required String patientPassword,
  }) async {
    try {
      Patient patient = Patient(
        patientName: patientName,
        patientDOB: patientDOB,
        address: address,
        contactNo: contactNo,
        patientEmail: patientEmail,
        patientPassword: patientPassword,
      );

      http.Response res = await http.post(
        Uri.parse('http://10.10.19.103:3000/api/patient/signup'),
        body: patient.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      await httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Patient account created! Please login.');
        },
      );

      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //signin patient
  void signinPatient({
    required BuildContext context,
    required String patientEmail,
    required String patientPassword,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://10.10.19.103:3000/api/patient/signin'),
        body: jsonEncode({
          "patientEmail": patientEmail,
          "patientPassword": patientPassword,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      await httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        },
      );

      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
