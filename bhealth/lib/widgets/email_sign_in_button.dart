import 'package:bhealth/widgets/enter_email_dialog.dart';
import 'package:flutter/material.dart';

class EmailSignInButtonWidget extends StatelessWidget {
  EmailSignInButtonWidget();

  void _showEmailEnterDialog(BuildContext context) {
    final TextEditingController _controllerEmail = new TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return EnterEmailDialog(_controllerEmail);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ButtonTheme(
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
            _showEmailEnterDialog(context);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Sign in with Email',
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
      ),
    );
  }
}
