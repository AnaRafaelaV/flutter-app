import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#c1d82f"),
        child: Center(
            child: Column(
          children: <Widget>[
            Image.asset(whiteLogo),
            SizedBox(
              height: 30,
            ),
            LoadingIndicator(
              indicatorType: Indicator.ballPulse,
              color: Colors.white,
            )
          ],
        )),
      ),
    );
  }
}
