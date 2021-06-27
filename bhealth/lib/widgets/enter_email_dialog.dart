import 'package:bhealth/view_models/login_view_model.dart';
import 'package:bhealth/widgets/enter_password_dailog.dart';
import 'package:flutter/material.dart';

class EnterEmailDialog extends StatelessWidget {
  final TextEditingController controllerEmail;
  LoginViewModel _loginViewModel = LoginViewModel();

  bool isRegistered = false;

  EnterEmailDialog(this.controllerEmail);

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  void _showInsertPassword(BuildContext context) async {
    if (_form.currentState!.validate()) {
      isRegistered =
          await _loginViewModel.isEmailRegistered(controllerEmail.text);
      isRegistered = isRegistered != null;
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return EnterPasswordDialog(isRegistered, controllerEmail.text);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text("Please enter your email."),
      content: Container(
        height: 100,
        child: Form(
          key: _form,
          child: TextFormField(
            controller: controllerEmail,
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return "Type a valid e-mail";
              }
            },
            autocorrect: false,
            decoration: new InputDecoration(labelText: "E-mail"),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              _showInsertPassword(context);
            },
            child: Text("Next"))
      ],
    );
  }
}
