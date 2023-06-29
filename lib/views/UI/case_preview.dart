// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawbook/constants/color_palette.dart';
import 'package:lawbook/models/file_model.dart';
class CasePreviewPage extends StatefulWidget {
  CasePreviewPage({super.key, required this.file});

  FileModel file;

  @override
  State<CasePreviewPage> createState() => _CasePreviewPageState();
}

class _CasePreviewPageState extends State<CasePreviewPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        title: Text(
          'Preview',
          style: GoogleFonts.roboto(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorPalette().mainTitleColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.06),
        child: ListView(
          children: [
            Text(widget.file.caseNo),
            Text(widget.file.caseDescription),
            Text(widget.file.section),
            Text(widget.file.client.name),
            Text(widget.file.client.phone),
            Text(widget.file.client.advocateRep),
            Text(widget.file.hearings.toString()),
            Text(widget.file.importance.toString()),
            Text(widget.file.opposition.advocateRep),
            Text(widget.file.court),
            
          ],
        ),
      ),
    );
  }
}
