import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({super.key});

  @override
  State<_HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen> {
  @override
  void initState() {
    super.initState();
    initBannerAdd();
  }

  late BannerAd _bannerAd;
  bool isAddLoaded = false;

  initBannerAdd() {
    _bannerAd = BannerAd(
      adUnitId: '',
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            isAddLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          print('Error loading $error');
        },
      ),
      request: const AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio App'),
      ),
      body: Center(
        child: Text('Hello, Dio!'),
      ),
      bottomNavigationBar: isAddLoaded
          ? SizedBox(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : Container(),
    );
  }
}
