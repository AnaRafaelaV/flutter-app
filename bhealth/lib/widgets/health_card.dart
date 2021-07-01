import 'package:bhealth/utils/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthCard extends StatelessWidget {
  final String image;
  final String name;
  final String onClickNextRoute;

  HealthCard(this.image, this.name, this.onClickNextRoute);

  final AppNavivator _appNavivator = AppNavivator();

  void _navigateToRoute() {
    _appNavivator.navigateTo(onClickNextRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _navigateToRoute();
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Text(name),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset(image) as ImageProvider,
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
