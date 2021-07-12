import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class HealthCard extends StatelessWidget {
  final String icon;
  final String mainLabel;
  final String otherInfo;
  final void Function() onTap;

  HealthCard(
      {required this.icon,
      required this.mainLabel,
      required this.otherInfo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        color: HexColor("#DCDCDB"),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Container(
              padding: EdgeInsets.only(top: 30, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainLabel,
                    style: TextStyle(
                      color: HexColor("#2EA9E8"),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    otherInfo,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

class AddHealthCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height,
      color: HexColor("#D4EFFC"),
      child: Row(
        children: [
          SvgPicture.asset(addIcon),
          Container(
            padding: EdgeInsets.only(top: 40, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Novo",
                  style: TextStyle(
                    color: HexColor("#2EA9E8"),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
