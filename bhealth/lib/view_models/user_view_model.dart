import 'package:bhealth/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserViewModel {
  String message = "";
  final Users user;
  UserViewModel({required this.user});

  String get userId {
    return user.userId;
  }

  String get email {
    return user.general["email"];
  }

  bool checkGoogleUserSaved(String emailGoogle) {
    bool isUserSaved = false;
    FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        UserViewModel.fromSnapshot(doc);
        if (email == emailGoogle) {
          isUserSaved = true;
        }
      });
    });
    return isUserSaved;
  }

  Future<bool> saveUser() async {
    bool isSaved = false;
    final user = Users({"email": email});
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      isSaved = true;
    } on Exception catch (_) {
      message = "Unable to save the user";
    } catch (error) {
      message = "Error occured!";
    }
    return isSaved;
  }

  factory UserViewModel.fromSnapshot(QueryDocumentSnapshot doc) {
    final user = Users.fromSnapshot(doc);
    return UserViewModel(user: user);
  }
}
