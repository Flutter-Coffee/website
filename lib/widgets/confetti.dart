import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/widgets.dart';

Widget leftConfettiNode(ConfettiController controllerCenterLeft) {
  return (
        Align(
          alignment: Alignment.centerLeft,
          child: ConfettiWidget(
            confettiController: controllerCenterLeft,
            blastDirection: -pi / 2,
            emissionFrequency: 0.02,
            numberOfParticles: 50,
            maxBlastForce: 100,
            minBlastForce: 80,
            gravity: 0.1,
          ),
        )
  );
}

Widget rightConfettiNode(ConfettiController controllerCenterRight) {
  return (
        Align(
          alignment: Alignment.centerRight,
          child: ConfettiWidget(
            confettiController: controllerCenterRight,
            blastDirection: -pi / 2,
            emissionFrequency: 0.02,
            numberOfParticles: 50,
            maxBlastForce: 100,
            minBlastForce: 80,
            gravity: 0.1,
          ),
        )
  );
}