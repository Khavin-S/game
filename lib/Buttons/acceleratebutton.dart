import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bike.dart';
import 'package:run/controller.dart';

class AccelerationButton extends Button with TapCallbacks {
  static bool accelerationButtonIsTapped =
      false; //accelerationButtonComponent tap notifier
  late SpriteAnimation accelerationButtonAnimation; //declaring button
  late SpriteAnimationComponent
      accelerationButtonComponent; //declaring variable for component(specific image from spritesheet)

  @override
  Future<void> onLoad() async {
    //loading spritesheet
    spriteSheet = SpriteSheet(
        image: await Flame.images.load('finalsprite.png'),
        srcSize: Vector2(36, 36));
    //loading a specific movement animation from spritesheet
    accelerationButtonAnimation =
        spriteSheet.createAnimation(row: 4, stepTime: .1, to: 1);
    //adding animation to be displayed to button component
    accelerationButtonComponent = SpriteAnimationComponent()
      ..animation = accelerationButtonAnimation
      ..size = Vector2(120, 100);
    add(accelerationButtonComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    //checking whether the button is taapped
    if (accelerationButtonIsTapped) {
      //if tapped
      Bike().onAccelerate();
    } else {
      //if button released
      Bike().onRelease();
    }
  }

//Acceleration Button tap Event
  @override
  void onTapDown(TapDownEvent event) {
    accelerationButtonIsTapped = true;
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    accelerationButtonIsTapped = false;
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    accelerationButtonIsTapped = false;
  }
}
