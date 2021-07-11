import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: HexColor("#B9D329"),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 20,
      unselectedFontSize: 20,
      onTap: (value) {
        _currentIndex = value;
      },
      currentIndex: _currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              notificationIcon,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              calendarIcon,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sosIcon,
            ),
            label: ""),
        BottomNavigationBarItem(icon: Image.asset(navBclose), label: ""),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              profileIcon,
            ),
            label: ""),
      ],
    );
  }
}
