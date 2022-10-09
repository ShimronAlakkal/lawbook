// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lawbook/home_view.dart';
import 'package:lawbook/views/onboard/onboard.dart';
import 'package:lawbook/views/onboard/sign_in.dart';
import 'package:lawbook/views/onboard/sign_up.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  // await Firebase.initializeApp();

  runApp(
    const MaterialApp(
      title: 'LawBook',
      debugShowCheckedModeBanner: false,
      home: Onboard(),
    ),
  );
}
