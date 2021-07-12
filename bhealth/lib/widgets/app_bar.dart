import 'package:bhealth/utils/app_navigator.dart';
import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class BhealthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool back;
  final bool graph;
  final bool share;
  final bool profile;
  final String title;

  MainAxisAlignment _alignment = MainAxisAlignment.spaceBetween;
  BhealthAppBar(
      {required this.back,
      required this.graph,
      required this.share,
      required this.title,
      required this.profile});

  @override
  Widget build(BuildContext context) {
    bool _titleExists = title != null && title.length > 0;
    if (!back && profile) {
      _alignment = MainAxisAlignment.end;
    }
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        color: HexColor("#B9D329"),
        child: Row(
          mainAxisAlignment: _alignment,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                back
                    ? IconButton(
                        icon: SvgPicture.asset(backIcon),
                        iconSize: 38,
                        onPressed: () {
                          AppNavigator().navigateToPreviousPage(context);
                        },
                      )
                    : Container(),
                graph
                    ? IconButton(
                        icon: SvgPicture.asset(graphIcon),
                        iconSize: 38,
                        onPressed: () {
                          AppNavigator().navigateToPreviousPage(context);
                        },
                      )
                    : Container(),
                share
                    ? IconButton(
                        icon: SvgPicture.asset(shareIcon),
                        iconSize: 38,
                        onPressed: () {
                          AppNavigator().navigateToPreviousPage(context);
                        },
                      )
                    : Container(),
              ],
            ),
            _titleExists
                ? Container(
                    padding: EdgeInsets.only(right: 50),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Roboto"),
                    ),
                  )
                : Container(),
            profile
                ? Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://googleflutter.com/sample_image.jpg'),
                          fit: BoxFit.fill),
                    ),
                  )
                : Container(),
          ],
        ),
      )
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
