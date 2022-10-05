import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CaseView extends StatefulWidget {
  const CaseView({super.key});

  @override
  State<CaseView> createState() => _CaseViewState();
}

class _CaseViewState extends State<CaseView> {
  bool isBannerAdLoaded = false;
  late BannerAd _bannerAd;

  @override
  void initState() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-7467125766317541/9930857264',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isBannerAdLoaded = true;
            });
          },
        ),
        request: const AdRequest())
      ..load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      isBannerAdLoaded
          ? SizedBox(
              child: AdWidget(ad: _bannerAd),
            )
          : SizedBox(
              child: Center(
                child: Text('ADs on load'),
              ),
            )
    ]);
  }
}
