import 'package:flutter/material.dart';

class Tools {
  Tools();

  String dateFormatterFromDate({required DateTime date}) {
    String year = date.toString().substring(0, 4);
    String month = date.toString().substring(5, 7);
    String day = date.toString().substring(8, 10);
    return '$day/$month/$year';
  }

  errorTextHandling(String error) {
    for (int i = 0; i < error.length; i++) {
      if (error[i] == ']') {
        return error.substring(i + 1, error.length);
      }
    }
    return error;
  }

  bool isValidPassword({required String password}) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return RegExp(pattern).hasMatch(password);
  }

  void popRouteUntilRoot(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.pop(context);
      popRouteUntilRoot(context);
    }
  }

  bool isValidUPI(String upi) {
    if (upi.contains('@') && upi.length >= 10) {
      return true;
    }
    return false;
  }

  bool isValidEmail(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  String kmbGenerator(double amount, bool makeK) {
    if (amount > 999 && amount < 99999 && makeK) {
      return "${(amount / 1000).toStringAsFixed(2)} K";
    } else if (amount > 99999 && amount < 999999) {
      return "${(amount / 1000).toStringAsFixed(2)} K";
    } else if (amount > 999999 && amount < 999999999) {
      return "${(amount / 1000000).toStringAsFixed(2)} M";
    } else if (amount > 999999999) {
      return "${(amount / 1000000000).toStringAsFixed(2)} B";
    } else {
      return amount.toString();
    }
  }
}
