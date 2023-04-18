// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lawbook/models/file_model.dart';

class CasePreviewPage extends StatelessWidget {
  CasePreviewPage({super.key, required this.file});

  FileModel file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Text('this is where data will go.')
      ],),
    );
  }
}
