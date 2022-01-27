import 'package:flutter/material.dart';

abstract class Entity {
  double x = 0;
  double y = 0;
  String spriteName = "";
  bool visible = true;
  List sprites = [];

  Entity(this.spriteName, int spritCount) {
    for (var i = 0; i < spritCount; i++) {
      sprites.add(Image.asset("assets/$spriteName$i.png"));
    }
  }

  void update();
  void move();

  Widget build();
}
