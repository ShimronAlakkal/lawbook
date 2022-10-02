import 'package:flutter/material.dart';

class CaseView extends StatefulWidget {
  const CaseView({super.key});

  @override
  State<CaseView> createState() => _CaseViewState();
}

class _CaseViewState extends State<CaseView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        10,
        (index) => ListTile(
          title: Text(
            index.toString(),
          ),
        ),
      ),
    );
  }
}
