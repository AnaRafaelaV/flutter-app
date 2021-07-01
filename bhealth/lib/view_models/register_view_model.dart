import 'package:bhealth/models/user.dart';
import 'package:bhealth/view_models/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel {
  String message = "";
  late Users user;
  late UserViewModel _userViewModel;

  //register user on Firebase Auth
  Future<bool> register(String email, String password) async {
    bool isRegistered = false;
    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      isRegistered = userCredentials != null;
      if (isRegistered) {
        user = Users({"email": email});
        _userViewModel = UserViewModel(user: user);
        await _userViewModel.saveUser();
      }
    } catch (e) {
      message = "Error occured!";
      print(e);
    }
    return isRegistered;
  }
}
