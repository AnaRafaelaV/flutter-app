import 'package:bhealth/utils/app_navigator.dart';
import 'package:bhealth/utils/bhealth_assets.dart';
import 'package:bhealth/view_models/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool _isFormValid = false;

  _validateForm() async {
    String name = _name.text.trim();
    String email = _email.text.trim();
    String password = _pass.text.trim();
    String passwordConfirm = _passConfirm.text.trim();
    _signUpViewModel.validateFormToSignUp(
        name, email, password, passwordConfirm);

    if (_signUpViewModel.nameValid &&
        _signUpViewModel.emailValid &&
        _signUpViewModel.nameValid &&
        _signUpViewModel.passwordConfirmValid) {
      setState(() {
        _isFormValid = true;
      });
    } else {
      if (!_signUpViewModel.nameValid) {
        nameMessage = "Deve indicar o seu nome.";
      }
      if (!_signUpViewModel.emailValid) {
        emailMessage = "Introduza um e-mail válido.";
      }
      if (!_signUpViewModel.passwordValid) {
        passwordMessage =
            "Deve introduzir uma palavra-passe com pelo menos 6 carateres.";
      }
      if (_signUpViewModel.passwordValid &&
          !_signUpViewModel.passwordConfirmValid) {
        passwordMessage = "As palavras-passe inseridas não coincidem.";
      }
      setState(() {
        _isFormValid = false;
        nameMessage = nameMessage;
        emailMessage = emailMessage;
        passwordMessage = passwordMessage;
      });
    }
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deve preencher todos os campos do formulário'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(nameMessage)),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(emailMessage)),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(passwordMessage))
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  AppNavigator().navigateToPreviousPage(context);
                },
                child: Text(
                  "Ok",
                  style: TextStyle(color: HexColor("#B9D329")),
                ))
          ],
        );
      },
    );
  }

  _signUp() async {
    String name = _name.text.trim();
    String email = _email.text.trim();
    String password = _pass.text.trim();
    await _signUpViewModel.register(email, password, name);
  }

  _registerWithGoogle() async {
    await _signUpViewModel.registerAndSignInWithGoogle();
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
                          icon: SvgPicture.asset(
                            userIcon,
                            color: nameMessage == ""
                                ? HexColor("#9d9d9d")
                                : Colors.red,
                          ),
                          hintText: 'Nome',
                        ),
                        controller: _name,
                        onChanged: (velue) {
                          setState(() {
                            nameMessage = "";
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
                          icon: SvgPicture.asset(
                            emailIcon,
                            color: emailMessage == ""
                                ? HexColor("#9d9d9d")
                                : Colors.red,
                          ),
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                        controller: _email,
                        onChanged: (velue) {
                          setState(() {
                            emailMessage = "";
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
                            icon: SvgPicture.asset(
                              passwordIcon,
                              color: passwordMessage == ""
                                  ? HexColor("#9d9d9d")
                                  : Colors.red,
                            ),
                            border: InputBorder.none,
                            hintText: 'Password'),
                        obscureText: true,
                        controller: _pass,
                        onChanged: (velue) {
                          setState(() {
                            passwordMessage = "";
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
                          icon: SvgPicture.asset(
                            passwordIcon,
                            color: passwordMessage == ""
                                ? HexColor("#9d9d9d")
                                : Colors.red,
                          ),
                          border: InputBorder.none,
                          hintText: 'Confirmar password',
                        ),
                        controller: _passConfirm,
                        onChanged: (velue) {
                          setState(() {
                            passwordMessage = "";
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
                      onPressed: () async {
                        await _validateForm();
                        if (!_isFormValid) {
                          _showDialog(context);
                        } else {
                          await _signUp();
                          AppNavigator().navigateToHomeScreen(context);
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
                  onPressed: () async {
                    await _registerWithGoogle();
                    AppNavigator().navigateToHomeScreen(context);
                  },
                ),
              ),
            ],
          )),
    );
  }
}
