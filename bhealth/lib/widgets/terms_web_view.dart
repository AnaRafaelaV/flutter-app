import 'package:bhealth/pages/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditionsWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor("#c1d82f"),
        title: const Text('TERMOS E SERVIÇOS'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        )),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: const WebView(
          initialUrl: 'https://www.bclose.pt/pt/politica-privacidade',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      floatingActionButton: Container(
        height: 60,
        margin: EdgeInsets.only(left: 25),
        alignment: Alignment.bottomCenter,
        child: TextButton(
            child: Text(
              "Aceito",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Sign()));
            }),
      ),
    );
  }
}
