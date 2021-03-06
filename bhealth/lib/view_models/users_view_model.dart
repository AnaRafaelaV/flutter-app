import 'package:bhealth/models/care_taker.dart';
import 'package:bhealth/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersViewModel {
  String message = "";
  final Users user;
  UsersViewModel({required this.user});

  Future<bool> checkIfUserExists(String emailGoogle) async {
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

  Future<bool> saveUser(String name, String lastName, String email,
      bool hasAdmission, bool isPrivate, List<CareTaker> careTakers) async {
    bool isSaved = false;
    final user =
        Users(name, lastName, email, hasAdmission, isPrivate, careTakers);
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

  factory UsersViewModel.fromSnapshot(QueryDocumentSnapshot doc) {
    final user = Users.fromSnapshot(doc);
    return UsersViewModel(user: user);
  }
}
