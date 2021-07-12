import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:bhealth/widgets/app_bar.dart';
import 'package:bhealth/widgets/bottom_bar.dart';
import 'package:bhealth/widgets/temp_history_widget.dart';
import 'package:bhealth/widgets/temp_info_screen.dart';
import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BhealthAppBar(
          back: true, graph: true, share: true, title: "", profile: true),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TempInfoScreen(
              image: tempImage37,
              lastDate: "2021-05-06 15:40",
            ),
            TempHistory(history: ["36.5", "37", "38.5"])
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
