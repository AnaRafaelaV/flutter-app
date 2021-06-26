import 'package:bhealth/pages/home_screen_page.dart';
import 'package:bhealth/view_models/sign_in_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleButtonWidget extends StatelessWidget {
  final SigInViewModel signInVM;
  void _sigIn(BuildContext context) async {
    try {
      await signInVM.sigInGoogle();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreenPage()));
    } catch (error) {
      print("ERROR - $error");
    }
  }

  GoogleButtonWidget({required this.signInVM});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          _sigIn(context);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
