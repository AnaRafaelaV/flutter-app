import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenSate createState() => _HomeScreenSate();
}

class _HomeScreenSate extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#0081F7'),
        title: Text("B Close"),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 30,
        unselectedFontSize: 30,
        onTap: (value) {
          _currentIndex = value;
        },
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                homeIcon,
                color: _currentIndex == 0
                    ? HexColor("#0081F7")
                    : HexColor("#707070"),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                notificationIcon,
                color: _currentIndex == 1
                    ? HexColor("#0081F7")
                    : HexColor("#707070"),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                chatIcon,
                color: _currentIndex == 2
                    ? HexColor("#0081F7")
                    : HexColor("#707070"),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                calendarIcon,
                color: _currentIndex == 3
                    ? HexColor("#0081F7")
                    : HexColor("#707070"),
              ),
              label: ""),
        ],
      ),
    );
  }
}
