import 'package:bhealth/utils/app_navigator.dart';
import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class BhealthAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        color: HexColor("#B9D329"),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset(backIcon),
              iconSize: 38,
              onPressed: () {
                AppNavigator().navigateToPreviousPage(context);
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 40),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Termos e Condições',
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontFamily: "Roboto"),
              ),
            )
          ],
        ),
      )
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
