import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game_tutorial/entities/entity.dart';
import 'package:flutter_game_tutorial/utils/global_var.dart';

class Player extends Entity {
  Player() : super('player', 4) {
    x = 50;
    y = 150;
  }

  double _angel = 0;
  double _degree = 0;

  double _speed = 1.5;

  bool isMoveLeft = false;
  bool isMoveRight = false;

  @override
  Widget build() {
    return Positioned(
        top: y,
        left: x,
        child: visible
            ? Transform.rotate(
                angle: _angel,
                child: sprites.first,
              )
            : const SizedBox());
  }

  @override
  void move() {
    if (isMoveLeft) {
      _degree -= 5;
    }

    if (isMoveRight) {
      _degree += 5;
    }

    _angel = (_degree * 3.14) / 180;

    x += sin(_degree * 0.0175) * _speed;
    y -= cos(_degree * 0.0175) * _speed;

    if (x < 0) {
      x = GlobalVars.screenWidth;
    }

    if (y < 0) {
      y = GlobalVars.screenHeight;
    }

    if (x > GlobalVars.screenWidth - 30) {
      x = 0;
    }

    if (y > GlobalVars.screenHeight - 30) {
      y = 0;
    }

    isMoveLeft = false;
    isMoveRight = false;
  }

  @override
  void update() {
    move();
  }
}
