import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 45,
            padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
            child: TextField(
              decoration: InputDecoration(
                icon: SvgPicture.asset(emailIcon),
                border: InputBorder.none,
                hintText: 'Email',
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 45,
            padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
            child: TextField(
              decoration: InputDecoration(
                icon: SvgPicture.asset(passwordIcon),
                border: InputBorder.none,
                hintText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 45,
            child: OutlinedButton(
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              onPressed: () {
                print('Pressed');
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "OU",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            height: 45,
            minWidth: 45,
            shape: CircleBorder(
              side: BorderSide(
                width: 0.5,
                color: Colors.grey,
                style: BorderStyle.solid,
              ),
            ),
            child: Container(
              child: Image.asset(googleLogo),
              height: 30,
              width: 30,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}