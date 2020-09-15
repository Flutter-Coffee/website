import 'package:fcswebsite/widgets/social_media_buttons.dart';
import 'package:flutter/material.dart';

class SocialMediaBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 720) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InstagramButton(),
              SizedBox(width: 28),
              MeetupButton(),
              SizedBox(width: 28),
              TwitterButton(),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [MailButton(), SizedBox(width: 28), YoutubeButton(), SizedBox(width: 28), TwitchButton()],
              ))
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InstagramButton(),
        SizedBox(width: 28),
        MeetupButton(),
        SizedBox(width: 28),
        TwitterButton(),
        SizedBox(width: 28),
        MailButton(),
        SizedBox(width: 28),
        YoutubeButton(),
        SizedBox(width: 28),
        TwitchButton()
      ],
    );
  }
}
