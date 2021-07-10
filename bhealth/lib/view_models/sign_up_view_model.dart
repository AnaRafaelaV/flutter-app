import 'package:bhealth/models/user.dart';
import 'package:bhealth/view_models/users_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpViewModel {
  late Users user;
  late UsersViewModel _usersViewModel;
  bool nameValid = false;
  bool emailValid = false;
  bool passwordValid = false;
  bool passwordConfirmValid = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String emailAlreadyInUse = "";

  Future<UserCredential> registerAndSignInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    final googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    String? name = googleUser.displayName != null ? googleUser.displayName : "";
    user = Users(name!, "", googleUser.email, false, true, []);
    _usersViewModel = UsersViewModel(user: user);
    bool isSaved = await _usersViewModel.checkIfUserExists(googleUser.email);
    if (!isSaved) {
      await _usersViewModel
          .saveUser(name, "", googleUser.email, false, true, []);
    }
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<bool> register(String email, String password, String name) async {
    bool isRegistered = false;

    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      isRegistered = userCredentials != null;

      if (isRegistered) {
        user = Users(name, "", email, false, true, []);
        _usersViewModel = UsersViewModel(user: user);
        await _usersViewModel.saveUser(name, "", email, false, true, []);
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        emailAlreadyInUse = "Este email já tem conta associada";
      }
    } catch (e) {
      print("ERROR - $e");
    }

    return isRegistered;
  }

  bool _passwordsMatch(String password, String passwordConfirm) {
    if (password == passwordConfirm) {
      return true;
    }
    return false;
  }

  void validateFormToSignUp(
      String name, String email, String password, String passwordConfirm) {
    nameValid = false;
    emailValid = false;
    passwordValid = false;
    passwordConfirmValid = false;
    emailAlreadyInUse = "";
    if (name != null && name.length > 0) {
      nameValid = true;
    }
    if (email != null && email.length > 0) {
      const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
      final regExp = RegExp(pattern);
      if (regExp.hasMatch(email)) {
        emailValid = true;
      }
    }
    if (password != null && password.length > 5) {
      passwordValid = true;
    }
    if (passwordConfirm != null && passwordConfirm.length > 5) {
      if (_passwordsMatch(password, passwordConfirm)) {
        passwordConfirmValid = true;
      }
    }
  }
}
