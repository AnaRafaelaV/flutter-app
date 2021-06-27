import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel {
  Future<bool> register(String email, String password) async {
    bool isRegistered = false;
    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      isRegistered = userCredentials != null;
    } catch (e) {
      print(e);
    }
    return isRegistered;
  }
}
