import 'dart:ui';

import 'package:fcswebsite/widgets/countdown.dart';
import 'package:fcswebsite/widgets/social_media_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeRoute extends StatelessWidget {
  HomeRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("background.jpg"), fit: BoxFit.cover),
      ),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: <Widget>[
                      Image(
                        width: 200,
                        height: 200,
                        image: AssetImage("logo.png"),
                      ),
                      Text("Flutter Coffee Show", style: GoogleFonts.homemadeApple(fontSize: 48, color: Colors.black)),
                      SizedBox(height: 30),
                      Text(
                        "A Flutter show shaped by the community, with interesting but entertaining content ranging from live talks, news, packages, QAs and much more!",
                        style: GoogleFonts.architectsDaughter(fontSize: 36, color: Colors.black),
                      ),
                      SizedBox(height: 30),
                      Countdown(),
                      SizedBox(height: 30),
                      Text(
                        "Want to contribute or learn more?",
                        style: GoogleFonts.architectsDaughter(fontSize: 36, color: Colors.black),
                      ),
                      SizedBox(height: 30),
                      SocialMediaBar(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
