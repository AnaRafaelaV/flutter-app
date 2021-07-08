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
          child: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Image.asset(whiteLogo),
          ),
        ),
      ),
    );
  }
}
