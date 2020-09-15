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
  const MeetupButton() : super(tooltip: "Join the Meetup!", icon: const FaIcon(FontAwesomeIcons.meetup), websiteLink: "https://www.meetup.com/de-DE/Karlsruhe-Flutter-Meetup/events/272873369/", websiteName: "Meetup");
}

class MailButton extends SocialMediaButton {
  const MailButton() : super(tooltip: "Send us a Mail!", icon: const FaIcon(FontAwesomeIcons.envelope), websiteLink: "mailto:hi@flutter.coffee", websiteName: "Mail");
}

class YoutubeButton extends SocialMediaButton {
  const YoutubeButton() : super(tooltip: "Watch us on Youtube!", icon: const FaIcon(FontAwesomeIcons.youtube), websiteLink: "https://www.youtube.com/watch?v=q0TeefPH2qM", websiteName: "Youtube");
}

class TwitchButton extends SocialMediaButton {
  const TwitchButton() : super(tooltip: "Watch us on Twitch!", icon: const FaIcon(FontAwesomeIcons.twitch), websiteLink: "https://www.twitch.tv/fluttercoffee", websiteName: "Twitch");
}
class GithubButton extends SocialMediaButton {
  const GithubButton() : super(tooltip: "Star us on Github!", icon: const FaIcon(FontAwesomeIcons.github), websiteLink: "https://github.com/Flutter-Coffee/website", websiteName: "Github");
}
