import 'package:bhealth/models/user.dart';
import 'package:bhealth/view_models/users_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpViewModel extends ChangeNotifier {
  String message = "";
  late Users user;
  late UsersViewModel _userViewModel;

  Future<bool> register(String email, String password) async {
    bool isRegistered = false;
    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      isRegistered = userCredentials != null;
      if (isRegistered) {}
    } on FirebaseAuthException catch (e) {
      if (e.message == "email-already-in-use") {
        message = "Email already used";
      }
      notifyListeners();
    } catch (e) {
      print("ERROR - $e");
    }
    return isRegistered;
  }
}
