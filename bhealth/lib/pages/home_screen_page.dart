import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      drawer: Drawer(),
    );
  }
}
