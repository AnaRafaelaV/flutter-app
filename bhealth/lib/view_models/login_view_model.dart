import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel {
  String message = "";
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> sigInGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    final googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<bool> login(String email, String password) async {
    bool isLoggedIn = false;
    try {
      final userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      isLoggedIn = userCredentials != null;
    } on FirebaseAuthException catch (e) {
      message = e.code;
    } catch (e) {
      print(e);
    }
    return isLoggedIn;
  }

  Future<bool> isEmailRegistered(String email) async {
    bool isRegistered = false;
    final List<String> providers =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    isRegistered = providers == null || providers.isEmpty;
    return !isRegistered;
  }
}
