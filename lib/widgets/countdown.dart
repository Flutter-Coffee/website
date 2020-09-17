import 'dart:async';
import 'dart:math';

import 'package:fcswebsite/main.dart';
import 'package:fcswebsite/widgets/countdown_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:confetti/confetti.dart';

class Countdown extends StatefulWidget {
  Countdown({Key key}) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  Timer _timer;
  Duration _remainingTime;
  ConfettiController _controllerCenterRight;
  ConfettiController _controllerCenterLeft;

  @override
  void initState() {
    _remainingTime = Website.meetingDate.difference(DateTime.now());
    _controllerCenterRight = ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft = ConfettiController(duration: const Duration(seconds: 10));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds == 0) {
        setState(() {
          _controllerCenterLeft.play();
          _controllerCenterRight.play();
        });
        _timer.cancel();
      } else {
        setState(() {
          // Countdown timer
          _remainingTime = Website.meetingDate.difference(DateTime.now());
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 720) {
      return mobileCountdown();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ConfettiWidget(
            confettiController: _controllerCenterLeft,
            blastDirection: -pi / 2,
            emissionFrequency: 0.02,
            numberOfParticles: 50,
            maxBlastForce: 100,
            minBlastForce: 80,
            gravity: 0.1,
          ),
        ),
        CountdownNumber(
          number: _remainingTime.inDays.toString().padLeft(2, '0'),
          subtitle: "DAYS",
        ),
        SizedBox(width: 32),
        CountdownNumber(
          number: (_remainingTime.inHours % 24).toString().padLeft(2, '0'),
          subtitle: "HOURS",
        ),
        SizedBox(width: 32),
        CountdownNumber(
          number: (_remainingTime.inMinutes % 60).toString().padLeft(2, '0'),
          subtitle: "MINUTES",
        ),
        SizedBox(width: 32),
        CountdownNumber(
          number: (_remainingTime.inSeconds % 60).toString().padLeft(2, '0'),
          subtitle: "SECONDS",
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ConfettiWidget(
            confettiController: _controllerCenterRight,
            blastDirection: -pi / 2,
            emissionFrequency: 0.02,
            numberOfParticles: 50,
            maxBlastForce: 100,
            minBlastForce: 80,
            gravity: 0.1,
          ),
        ),
      ],
    );
  }

  Widget mobileCountdown() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ConfettiWidget(
            confettiController: _controllerCenterLeft,
            blastDirection: -pi / 2,
            emissionFrequency: 0.02,
            numberOfParticles: 50,
            maxBlastForce: 100,
            minBlastForce: 80,
            gravity: 0.1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CountdownNumber(
              number: _remainingTime.inDays.toString().padLeft(2, '0'),
              subtitle: "DAYS",
            ),
            SizedBox(width: 32),
            CountdownNumber(
              number: (_remainingTime.inHours % 24).toString().padLeft(2, '0'),
              subtitle: "HOURS",
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CountdownNumber(
                  number: (_remainingTime.inMinutes % 60).toString().padLeft(2, '0'),
                  subtitle: "MINUTES",
                ),
                SizedBox(width: 32),
                CountdownNumber(
                  number: (_remainingTime.inSeconds % 60).toString().padLeft(2, '0'),
                  subtitle: "SECONDS",
                ),
              ],
            )),
        Align(
          alignment: Alignment.centerRight,
          child: ConfettiWidget(
            confettiController: _controllerCenterRight,
            blastDirection: -pi / 2,
            emissionFrequency: 0.02,
            numberOfParticles: 50,
            maxBlastForce: 100,
            minBlastForce: 80,
            gravity: 0.1,
          ),
        ),
      ],
    );
  }
}
