import 'package:bhealth/utils/app_navigator.dart';
import 'package:bhealth/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditionsWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BhealthAppBar(
            back: true, title: "Termos e Condições", profile: false),
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            child: const WebView(
              initialUrl: 'https://www.bclose.pt/pt/politica-privacidade',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 25),
            width: MediaQuery.of(context).size.width / 1.4,
            decoration: BoxDecoration(),
            child: ElevatedButton(
                onPressed: () {
                  AppNavigator().navigateToHomeScreen(context);
                },
                child: const Text(
                  'Aceitar Termos e Condições',
                  style: TextStyle(
                      fontSize: 14, fontFamily: "Roboto", color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  primary: HexColor("#B9D329"),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 10),
                )),
          ),
        ]));
  }
}
