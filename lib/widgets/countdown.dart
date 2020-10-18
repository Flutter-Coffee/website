import 'dart:async';

import 'package:fcswebsite/widgets/confetti.dart';
import 'package:fcswebsite/widgets/countdown_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:confetti/confetti.dart';

import '../main.dart';

enum TimeUnit { seconds, minutes, hours, days }

class Countdown extends StatefulWidget {
  Countdown({Key key}) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  Duration _remainingTime;
  ConfettiController controllerCenterRight;
  ConfettiController controllerCenterLeft;

  @override
  void initState() {
    super.initState();
    setRemainingTime();
    initConfettiController();
    // Only start if the time has not already passed
    if (_remainingTime.inSeconds > 0) {
      startTimer();
    }
  }

  initConfettiController() {
    controllerCenterRight = ConfettiController(duration: const Duration(seconds: 10));
    controllerCenterLeft = ConfettiController(duration: const Duration(seconds: 10));
  }

  setRemainingTime() {
    if (Website.meetingDate.difference(DateTime.now().toUtc()).inSeconds <= 0) {
      _remainingTime = Duration(days: 0, hours: 0, minutes: 0, seconds: 0);
    } else {
      _remainingTime = Website.meetingDate.difference(DateTime.now().toUtc().toUtc());
    }
  }

  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // Stop timer when ready
      if (_remainingTime.inSeconds <= 0) {
        timer.cancel();
        _remainingTime = Duration(days: 0, hours: 0, minutes: 0, seconds: 0);
        startConfetti();
      } else {
        setState(() {
          _remainingTime = Website.meetingDate.difference(DateTime.now().toUtc());
        });
      }
    });
  }

  startConfetti() {
    setState(() {
      controllerCenterLeft.play();
      controllerCenterRight.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Devices < 720w idth
    if (MediaQuery.of(context).size.width < 720) {
      return mobileCountdown();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        leftConfettiNode(controllerCenterLeft),
        // Countdown timer
        getCountdown(TimeUnit.days, _remainingTime),
        SizedBox(width: 32),
        getCountdown(TimeUnit.hours, _remainingTime),
        SizedBox(width: 32),
        getCountdown(TimeUnit.minutes, _remainingTime),
        SizedBox(width: 32),
        getCountdown(TimeUnit.seconds, _remainingTime),
        rightConfettiNode(controllerCenterRight)
      ],
    );
  }

  Widget mobileCountdown() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        leftConfettiNode(controllerCenterLeft),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getCountdown(TimeUnit.days, _remainingTime),
            SizedBox(width: 32),
            getCountdown(TimeUnit.hours, _remainingTime),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[getCountdown(TimeUnit.minutes, _remainingTime), SizedBox(width: 32), getCountdown(TimeUnit.seconds, _remainingTime)],
            )),
        rightConfettiNode(controllerCenterRight)
      ],
    );
  }
}

// Get right countdown depending on timeunit displaying the remaining time
Widget getCountdown(TimeUnit timeUnit, Duration remainingTime) {
  switch (timeUnit) {
    case TimeUnit.seconds:
      return (CountdownNumber(
        number: remainingTime.inSeconds % 60,
        subtitle: "SECONDS",
      ));
      break;
    case TimeUnit.minutes:
      return (CountdownNumber(
        number: remainingTime.inMinutes % 60,
        subtitle: "MINUTES",
      ));
      break;
    case TimeUnit.hours:
      return (CountdownNumber(
        number: remainingTime.inHours % 24,
        subtitle: "HOURS",
      ));
      break;
    case TimeUnit.days:
      return (CountdownNumber(
        number: remainingTime.inDays,
        subtitle: "DAYS",
      ));
      break;
    default:
      return (CountdownNumber(
        number: remainingTime.inSeconds % 60,
        subtitle: "SECONDS",
      ));
  }
}
