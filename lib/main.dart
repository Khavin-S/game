import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  @override
  Color backgroundColor() => Color.fromARGB(255, 13, 72, 121);
  Future<void> onLoad() async {}
  @override
  void update(double dt) {}
}
