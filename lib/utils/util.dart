import 'package:flutter/material.dart';
void showSnackBar(BuildContext context, String message) {
  print('Showing SnackBar: $message'); // Add this print statement

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
