import 'package:bhealth/pages/home_page.dart';
import 'package:bhealth/pages/login_page.dart';
import 'package:flutter/material.dart';

class AppNavivator {
  void navigateToHomeScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreenPage()));
  }

  void navigateToProfileScreen(BuildContext context) {
    // Navigator.push(
    //    context, MaterialPageRoute(builder: (context) => HomeScreenPage()));
  }

  void navigateToLoginScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LogInPage()));
  }

  void navigateToCalendarScreen(BuildContext context) {}
  void navigateToNotificationsScreen(BuildContext context) {}
  void navigateToChatScreen(BuildContext context) {}
}
