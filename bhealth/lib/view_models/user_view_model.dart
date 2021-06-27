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

  Future<bool> checkGoogleUserSaved(String emailGoogle) async {
    bool isUserSaved = false;
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection("users").get();
    final List<DocumentSnapshot> documents = result.docs;
    documents.forEach((doc) {
      try {
        final email = doc.get("general")["email"];
        if (email == emailGoogle) {
          isUserSaved = true;
        }
      } catch (e) {
        print("ERROR - $e");
      }
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
