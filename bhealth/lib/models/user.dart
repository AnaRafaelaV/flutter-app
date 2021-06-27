import 'package:flutter/material.dart';

class User {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final bool hasAdmission;
  final bool inPrivate;

  var careTakers;
  //final List<CareTaker> careTakers;

  User(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.hasAdmission,
      //@required this.careTakers,
      this.inPrivate = false});
}
