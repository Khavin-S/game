import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/painting.dart';
import 'package:run/bike1.dart';
import 'package:run/track.dart';

class ScoreBoard extends TextBoxComponent {
  late TextComponent displayGear;
  late TextComponent displaySpeed;
  late FpsTextComponent fps;
  @override
  Future<void> onLoad() async {
    displayGear = TextComponent()
      ..text = "GEAR : ${Bike1.gear.toString()}"
      ..textRenderer = TextPaint(
          style: TextStyle(
              color: BasicPalette.black.color,
              fontSize: 20,
              fontWeight: FontWeight.bold));
    add(displayGear);
    displaySpeed = TextBoxComponent()
      ..text = "SPEED : 0"
      ..textRenderer = TextPaint(
          style: TextStyle(
              color: BasicPalette.black.color,
              fontSize: 20,
              fontWeight: FontWeight.bold))
      ..position = Vector2(0, 20);
    add(displaySpeed);
  }

  @override
  void update(double dt) {
    displayGear.text = "GEAR : ${Bike1.gear..toInt().toString()}";
    displaySpeed.text = "SPEED : ${Bike1.speed.toInt().toString()}";
    super.update(dt);
  }
}
