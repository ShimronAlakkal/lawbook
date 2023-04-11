// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawbook/home_view.dart';
import 'package:lawbook/utils/tools.dart';
import 'package:lawbook/views/onboard/onboard.dart';
import 'package:lawbook/widgets/custom_widgets.dart';

class PassWordResetService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  sendResetEmail(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      CustomWidget().customSnackBarWithText(
          content: 'Password reset email has been sent.', context: context);
      Timer(
        const Duration(seconds: 3),
        () => CustomWidget().moveToPage(
            page: const Onboard(), context: context, replacement: true),
      );
    } catch (e) {
      CustomWidget().customSnackBarWithText(
          content: Tools().errorTextHandling(e.toString()), context: context);
    }
  }
}
