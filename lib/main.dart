import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lawbook/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MaterialApp(
      title: 'LawBook',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  );
}
