import 'package:bhealth/widgets/email_sign_in_button.dart';
import 'package:bhealth/widgets/google_sign_in_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Spacer(
            flex: 1,
          ),
          Image.asset('assets/images/bclose.png'),
          Spacer(
            flex: 2,
          ),
          GoogleButtonWidget(),
          SizedBox(
            height: 15,
          ),
          EmailSignInButtonWidget(),
          SizedBox(
            height: 10,
          ),
          TextButton(
            child: Text(
              "Terms of service",
              style:
                  TextStyle(fontSize: 15, decoration: TextDecoration.underline),
            ),
            onPressed: () async => await launch("http://bhealth.bclose.pt/"),
          ),
          SizedBox(
            width: double.infinity,
            height: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor('#0081F7'),
        title: Text("B Close"),
        centerTitle: true,
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }
}
