import 'package:bhealth/models/user.dart';
import 'package:bhealth/view_models/users_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewModel {
  late Users user;
  late UsersViewModel _userViewModel;

  Future<bool> register(String email, String password, String name) async {
    bool isRegistered = false;

    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      isRegistered = userCredentials != null;

      if (isRegistered) {
        user = Users(name, "", email, false, true, []);
        _userViewModel = UsersViewModel(user: user);
        await _userViewModel.saveUser(name, "", email, false, true, []);
      }
    } catch (e) {
      print("ERROR - $e");
    }

    return isRegistered;
  }

  bool passwordsMatch(String password, String passwordConfirm) {
    if (password == passwordConfirm) {
      return true;
    }
    return false;
  }
}
