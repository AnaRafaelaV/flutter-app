import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TempInfoScreen extends StatelessWidget {
  final String image;
  final String lastDate;

  TempInfoScreen({required this.image, required this.lastDate});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 30),
            decoration: BoxDecoration(color: HexColor("#DCDCDB")),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Image(image: AssetImage(image)),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 250),
                    child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: HexColor("#00AEEF").withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(30)),
                          child: Text("START"),
                          onPressed: () {},
                        ))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: HexColor("#00AEEF")),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "TERMÓMETRO",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    lastDate,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
