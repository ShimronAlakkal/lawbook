import 'package:flutter/material.dart';

class CaseView extends StatefulWidget {
  const CaseView({super.key});

  @override
  State<CaseView> createState() => _CaseViewState();
}

class _CaseViewState extends State<CaseView> {
  bool isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView(children: const[]);
  }
}
