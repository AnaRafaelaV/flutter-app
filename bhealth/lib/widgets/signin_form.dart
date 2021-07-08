import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:bhealth/view_models/sign_in_view_model.dart';
import 'package:bhealth/widgets/terms_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final SignInViewModel _inViewModel = SignInViewModel();
  late bool isRegistered;

  Future<bool> checkIfEmailIsRegistered() async {
    isRegistered = await _inViewModel.isEmailRegistered(_controllerEmail.text);
    return isRegistered;
  }

  String message = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: HexColor("#E3E3E3"), width: 1)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: SvgPicture.asset(emailIcon),
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                      autofocus: true,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: HexColor("#E3E3E3"), width: 1),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(passwordIcon),
                          border: InputBorder.none,
                          hintText: 'Password'),
                      obscureText: true,
                      controller: _pass,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(top: 15),
              child: OutlinedButton(
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: HexColor("#B9D329")),
                  backgroundColor: HexColor("#B9D329"),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "OU",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: MaterialButton(
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(googleLogo),
                  height: 45,
                  width: 45,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 30),
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
