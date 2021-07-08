import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:bhealth/view_models/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _passConfirm = TextEditingController();
  final TextEditingController _name = TextEditingController();

  String nameMessage = "";
  String emailMessage = "";
  String passwordMessage = "";

  SignUpViewModel _signUpViewModel = SignUpViewModel();
  bool _passwordMatchs = true;

  bool _passwordsMatch() {
    String password = _pass.text;
    String passwordConfirm = _passConfirm.text;
    _passwordMatchs =
        _signUpViewModel.passwordsMatch(password, passwordConfirm);
    return _passwordMatchs;
  }

  _signUp() async {
    String name = _name.text;
    String email = _email.text;
    String password = _pass.text;
    await _signUpViewModel.register(email, password, name);
  }

  _resetInputValidation() {
    _form.currentState!.validate();
  }

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
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: SvgPicture.asset(userIcon),
                          hintText: 'Nome',
                        ),
                        controller: _name,
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {
                            nameMessage = "";
                            _resetInputValidation();
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(color: HexColor("#E3E3E3"), width: 1),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: SvgPicture.asset(emailIcon),
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                        controller: _email,
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {
                            emailMessage = "";
                            _resetInputValidation();
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
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
                          setState(() {
                            passwordMessage = "";
                            _resetInputValidation();
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: HexColor("#E3E3E3"), width: 1),
                        ),
                      ),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: SvgPicture.asset(passwordIcon),
                          border: InputBorder.none,
                          hintText: 'Confirmar password',
                        ),
                        controller: _passConfirm,
                        onChanged: (value) {
                          setState(() {
                            passwordMessage = "";
                            _resetInputValidation();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.only(left: 20, right: 5, top: 15),
                    child: OutlinedButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        side:
                            BorderSide(width: 1.0, color: HexColor("#B9D329")),
                        backgroundColor: HexColor("#B9D329"),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      onPressed: () {
                        if (_passwordsMatch() &&
                            _form.currentState!.validate()) {
                          _signUp();
                        } else {
                          setState(() {
                            _passwordMatchs = false;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.only(left: 5, right: 20, top: 15),
                    child: OutlinedButton(
                      child: Text(
                        'Language',
                        style:
                            TextStyle(fontSize: 18, color: HexColor("#B9D329")),
                      ),
                      style: OutlinedButton.styleFrom(
                        side:
                            BorderSide(width: 1.0, color: HexColor("#B9D329")),
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
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
            ],
          )),
    );
  }
}
