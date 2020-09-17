import 'dart:ui';

import 'package:fcswebsite/widgets/countdown.dart';
import 'package:fcswebsite/widgets/social_media_bar.dart';
import 'package:fcswebsite/widgets/social_media_buttons.dart';
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
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
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
                      Text("Flutter Coffee Show", style: GoogleFonts.homemadeApple(fontSize: 48, color: Colors.white)),
                      SizedBox(height: 30),
                      SocialMediaBar(),
                      SizedBox(height: 30),
                      Container(
                        margin: (MediaQuery.of(context).size.width < 720) ? EdgeInsets.only(left: 0, right: 0) : EdgeInsets.only(left: 200, right: 200),
                        child: Text(
                          "A Flutter show shaped by the community, with interesting but entertaining content ranging from live talks, news, packages, QAs and much more!\nTo get the latest updates, make sure to follow us on our social media channels above and tune in for our first show on the 17th of September 5 pm UTC!",
                          style: GoogleFonts.architectsDaughter(fontSize: 36, color: Colors.white70),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text("Made with ♥ and obviously flutter web :)", style: GoogleFonts.roboto(fontSize: 24, color: Colors.white)),
                      GithubButton(),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
