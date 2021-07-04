import 'package:bhealth/pages/sign_in.dart';
import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:bhealth/widgets/signup_form.dart';
import 'package:bhealth/widgets/terms_web_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              child: Image.asset(bcloseImage),
            ),
            SizedBox(
              height: 50,
            ),
            SignupForm(),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: RichText(
                textAlign: TextAlign.center,
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: 'By signing in you agree to our '),
                    new TextSpan(
                        text: 'Terms & Conditions ',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TermsAndConditionsWebView()));
                          }),
                    new TextSpan(text: 'and '),
                    new TextSpan(
                        text: 'Privacy Policy',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#c1d82f"),
          title: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Sign up",
              ),
              Tab(
                text: "Sign in",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [SignupPage(), SigninPage()],
        ),
      ),
    );
  }
}
