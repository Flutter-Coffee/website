import 'package:fcswebsite/routes/home_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Website());
}

class Website extends StatelessWidget {

  static final DateTime MEETING_DATE = DateTime(2020, 9, 17, 19);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Coffee Show',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark
      ),
      home: Scaffold(
          body: HomeRoute(),
      ),
    );
  }
}