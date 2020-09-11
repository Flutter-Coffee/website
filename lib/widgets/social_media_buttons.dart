import 'dart:html';

import 'package:flutter/material.dart';

abstract class SocialMediaButton extends StatelessWidget {
  final String tooltip;
  final Image icon;
  final String websiteLink;
  final String websiteName;

  const SocialMediaButton({Key key, this.tooltip, this.icon, this.websiteLink, this.websiteName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Container(
        height: 60,
        width: 60,
        child: Material(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(200)),
          child: InkWell(
            onTap: () async {
              window.open(websiteLink, websiteName);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

}

class InstagramButton extends SocialMediaButton {
  const InstagramButton() : super(
    tooltip:  "Follow us on Instagram!",
    icon: const Image(image: AssetImage("instagram.png")),
    websiteLink: "https://instagram.com/flutter.coffee",
    websiteName: "Instagram"
  );
}

class TwitterButton extends SocialMediaButton {
  const TwitterButton() : super(
      tooltip:  "Follow us on Twitter!",
      icon: const Image(image: AssetImage("twitter.png")),
      websiteLink: "https://twitter.com/fluttercoffee",
      websiteName: "Twitter"
  );
}

class MeetupButton extends SocialMediaButton {
  const MeetupButton() : super(
      tooltip:  "Join the Meetup!",
      icon: const Image(image: AssetImage("meetup.png")),
      websiteLink: "http://meetu.ps/e/JjFHN/FZPLN/d",
      websiteName: "Meetup"
  );
}

class MailButton extends SocialMediaButton {
  const MailButton() : super(
      tooltip:  "Send us a Mail!",
      icon: const Image(image: AssetImage("mail.png")),
      websiteLink: "mailto:hi@flutter.coffee",
      websiteName: "Mail"
  );
}