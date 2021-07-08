import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#B9D329"),
        child: Center(
            child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.5),
              child: Image.asset(whiteLogo),
            ),
            Container(
              height: 20,
              child: LoadingIndicator(
                indicatorType: Indicator.ballPulse,
                color: Colors.white,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
