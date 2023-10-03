import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bike1.dart';
import 'package:run/controller.dart';

class BreakButton extends Controller with TapCallbacks {
  bool breakButtonIsTapped = false; 
  late SpriteAnimation breakButtonAnimation; 
  late SpriteAnimationComponent breakButtonComponent; 

  @override
  Future<void> onLoad() async {
    spriteSheet = SpriteSheet(image: await Flame.images.load('finalsprite.png'),srcSize: Vector2(36, 36));
    breakButtonAnimation = spriteSheet.createAnimation(row: 4, stepTime: .1, from: 1, to: 2);
    breakButtonComponent = SpriteAnimationComponent()
      ..animation = breakButtonAnimation
      ..size = Vector2(120, 100);
    add(breakButtonComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (breakButtonIsTapped) {
      Bike1().onBreak(dt);
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    breakButtonIsTapped = true;
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    breakButtonIsTapped = false;
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    breakButtonIsTapped = false;
  }
}
