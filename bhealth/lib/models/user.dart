import 'package:bhealth/models/care_taker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String firstName;
  final String lastName;
  final String email;
  final bool hasAdmission;
  final bool inPrivate;
  final DocumentReference? uid;
  final List<CareTaker> careTakers;

  Users(this.firstName, this.lastName, this.email, this.hasAdmission,
      this.inPrivate, this.careTakers,
      [this.uid]);

  Users.nil(this.uid)
      : firstName = "",
        lastName = "",
        email = "",
        hasAdmission = false,
        careTakers = [],
        inPrivate = false;

  String get userId {
    return uid!.id;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> general = {
      "firstName": this.firstName,
      "lastName": this.lastName,
      "email": this.email,
    };

    return {
      "general": general,
      "in_private": this.inPrivate,
      "care_taker": this.careTakers != null && careTakers.isNotEmpty
          ? this.careTakers.map((careTaker) => careTaker.toMap())
          : {},
    };
  }

  factory Users.fromSnapshot(QueryDocumentSnapshot doc) {
    Map<String, dynamic> general = doc['general'];
    List<dynamic> careTakerList = doc['care_taker'];

    if (general == null) {
      return Users.nil(doc.reference);
    } else {
      List<CareTaker> userCareTakers;

      if (careTakerList != null && careTakerList.isNotEmpty) {
        userCareTakers = careTakerList
            .map((careTaker) => CareTaker.fromSnapshot(careTaker))
            .toList(growable: false);
      } else {
        userCareTakers = [];
      }

      return Users(
          general["name"],
          general["lastName"],
          general["email"],
          doc.get('admission'),
          doc['in_private'],
          userCareTakers,
          doc.reference);
    }
  }
}
