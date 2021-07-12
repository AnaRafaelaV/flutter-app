import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class TempHistory extends StatelessWidget {
  final List history;

  TempHistory({required this.history});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(left: 2.5),
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
            decoration: BoxDecoration(color: HexColor("#4D4D4D")),
            width: MediaQuery.of(context).size.width / 3.6,
            height: MediaQuery.of(context).size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  history[0],
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
            decoration: BoxDecoration(color: HexColor("#4D4D4D")),
            width: MediaQuery.of(context).size.width / 3.6,
            height: MediaQuery.of(context).size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  history[1],
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
            decoration: BoxDecoration(color: HexColor("#4D4D4D")),
            width: MediaQuery.of(context).size.width / 3.6,
            height: MediaQuery.of(context).size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  history[2],
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
