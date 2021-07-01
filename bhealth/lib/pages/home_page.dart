import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#0081F7'),
        title: Text("B Close"),
        centerTitle: true,
        elevation: 0,
        leading: Icon(
          Icons.menu,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {},
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                homeIcon,
                height: 40,
                width: 40,
                color: //_selectedIndex == 0
                    //? HexColor("#0081F7")
                    HexColor("#707070"),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                calendarIcon,
                height: 30,
                width: 30,
                color: //_selectedIndex == 1
                    // HexColor("#0081F7")
                    HexColor("#707070"),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                addIcon,
                height: 50,
                width: 50,
                color: HexColor("#0081F7"),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                chatIcon,
                height: 35,
                width: 35,
                color: //_selectedIndex == 3
                    //? HexColor("#0081F7")
                    HexColor("#707070"),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                profileIcon,
                height: 40,
                width: 40,
                color: // _selectedIndex == 4
                    //? HexColor("#0081F7")
                    HexColor("#707070"),
              ),
              label: ''),
        ],
      ),
    );
  }
}
