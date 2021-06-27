import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  //final String uid;
  //final String firstName;
  //final String lastName;
  //final String email;
  //final bool hasAdmission;
  //final bool inPrivate;
  final Map<String, dynamic> general;
  DocumentReference? reference;

  //var careTakers;
  //final List<CareTaker> careTakers;

  Users(this.general, [this.reference]);

  String get userId {
    return reference!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "general": general,
    };
  }

  factory Users.fromSnapshot(QueryDocumentSnapshot doc) {
    Map<String, dynamic> general = doc['general'];
    return Users(general, doc.reference);
  }
}
