import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:bhealth/widgets/app_bar.dart';
import 'package:bhealth/widgets/bottom_bar.dart';
import 'package:bhealth/widgets/health_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BhealthAppBar(back: false, title: "", profile: true),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  child: Container(
                    child: GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: <Widget>[
                        HealthCard(
                            icon: oximetro1,
                            mainLabel: "Oxímetro",
                            otherInfo: "SpO2"),
                        HealthCard(
                            icon: pressao,
                            mainLabel: "Pressão",
                            otherInfo: "Arterial"),
                        HealthCard(
                            icon: temp, mainLabel: "Temp.", otherInfo: "ºC"),
                        HealthCard(
                            icon: balanca,
                            mainLabel: "Balança",
                            otherInfo: "Kg/Lb"),
                        HealthCard(
                            icon: oximetro2,
                            mainLabel: "Oxímetro",
                            otherInfo: "SpO2"),
                        AddHealthCard()
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image(image: AssetImage(bannerImage)),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
