import 'package:bhealth/pages/home_page.dart';
import 'package:bhealth/view_models/home_page_view_model.dart';
import 'package:bhealth/widgets/terms_web_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppNavigator {
  navigateToPreviousPage(BuildContext context) {
    Navigator.pop(context);
  }

  navigateToHomeScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => HomePageViewModel(),
            child: HomePage(),
          ),
        ));
  }

  navigateToTermsScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TermsAndConditionsWebView()));
  }
}
