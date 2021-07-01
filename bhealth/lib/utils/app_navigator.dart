import 'package:bhealth/pages/home_page.dart';
import 'package:bhealth/pages/login_page.dart';
import 'package:flutter/material.dart';

class AppNavivator {
  Widget navigateToHomeScreen(BuildContext context) {
    //Navigator.push(
    //  context, MaterialPageRoute(builder: (context) => HomeScreen()));
    return HomeScreen();
  }

  void navigateToProfileScreen(BuildContext context) {
    // Navigator.push(
    //    context, MaterialPageRoute(builder: (context) => HomeScreenPage()));
  }

  Widget navigateToLoginScreen(BuildContext context) {
    //Navigator.push(
    //    context, MaterialPageRoute(builder: (context) => LogInPage()));
    return LogInPage();
  }

  void navigateToCalendarScreen(BuildContext context) {}
  void navigateToNotificationsScreen(BuildContext context) {}
  void navigateToChatScreen(BuildContext context) {}

  void navigateTo(String onClickNextRoute) {
    if (onClickNextRoute == "/oximeter") {
    } else if (onClickNextRoute == "/") {}
  }
}
