import 'package:cloud_firestore/cloud_firestore.dart';

class CareTaker {
  final String clientDepartmentId;
  final String clientDepartmentRoleId;
  final String clientId;

  CareTaker(
      {required this.clientDepartmentId,
      required this.clientDepartmentRoleId,
      required this.clientId});

  Map<String, dynamic> toMap() {
    return {
      "client_department_id": this.clientDepartmentId,
      "client_department_role_id": this.clientDepartmentRoleId,
      "client_id": this.clientId,
    };
  }

  factory CareTaker.fromSnapshot(QueryDocumentSnapshot doc) {
    return CareTaker(
        clientDepartmentId: doc["client_department_id"],
        clientDepartmentRoleId: doc["client_department_role_id"],
        clientId: doc["client_id"]);
  }

  static List<CareTaker> toList(doc) {
    return [];
  }
}
