import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class SocialMediaButton extends StatelessWidget {
  final String tooltip;
  final FaIcon icon;
  final String websiteLink;
  final String websiteName;

  const SocialMediaButton({Key key, this.tooltip, this.icon, this.websiteLink, this.websiteName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      icon: icon,
      onPressed: () async {
        window.open(websiteLink, websiteName);
      },
    );
  }
}

class InstagramButton extends SocialMediaButton {
  const InstagramButton() : super(tooltip: "Follow us on Instagram!", icon: const FaIcon(FontAwesomeIcons.instagram), websiteLink: "https://instagram.com/flutter.coffee", websiteName: "Instagram");
}

class TwitterButton extends SocialMediaButton {
  const TwitterButton() : super(tooltip: "Follow us on Twitter!", icon: const FaIcon(FontAwesomeIcons.twitter), websiteLink: "https://twitter.com/fluttercoffee", websiteName: "Twitter");
}

class MeetupButton extends SocialMediaButton {
  const MeetupButton() : super(tooltip: "Join the Meetup!", icon: const FaIcon(FontAwesomeIcons.meetup), websiteLink: "http://meetu.ps/e/JjFHN/FZPLN/d", websiteName: "Meetup");
}

class MailButton extends SocialMediaButton {
  const MailButton() : super(tooltip: "Send us a Mail!", icon: const FaIcon(FontAwesomeIcons.envelope), websiteLink: "mailto:hi@flutter.coffee", websiteName: "Mail");
}
