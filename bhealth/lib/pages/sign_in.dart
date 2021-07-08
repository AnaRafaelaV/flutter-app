import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:bhealth/widgets/signin_form.dart';
import 'package:bhealth/widgets/terms_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              child: Image.asset(bcloseLogo),
            ),
            SizedBox(
              height: 100,
            ),
            SigninForm(),
            SizedBox(
              height: 40,
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
