import 'package:flutter/material.dart';

class CustomToast {
  // these are instances of the class
  final String message;
  final Color color;

// contructor
  CustomToast({required this.message, required this.color});

// showSnackBar
// static method means this belongs to the class itself and not the instance
  static void showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ));
  }

  // showSnackBar
  static void showSuccessSnackBar(BuildContext context, String message) {
    showSnackBar(context, message, Colors.green);
  }

  static void showWarningSnackBar(BuildContext context, String message) {
    showSnackBar(context, message, Colors.orange);
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    showSnackBar(context, message, Colors.red);
  }
}
