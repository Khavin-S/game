import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bike.dart';
import 'package:run/controller.dart';

class BreakButton extends Controller with TapCallbacks {
  bool breakButtonIsTapped = false; //breakButtonComponent tap notifier
  late SpriteAnimation breakButtonAnimation; //declaring break button animation
  late SpriteAnimationComponent
      breakButtonComponent; //declaring variable for component(specific image from spritesheet)

  @override
  Future<void> onLoad() async {
    //loading spritesheet
    spriteSheet = SpriteSheet(
        image: await Flame.images.load('finalsprite.png'),
        srcSize: Vector2(36, 36));
    //loading a break button animation from spritesheet
    breakButtonAnimation =
        spriteSheet.createAnimation(row: 4, stepTime: .1, from: 1, to: 2);
    //adding break button animation to the component
    breakButtonComponent = SpriteAnimationComponent()
      ..animation = breakButtonAnimation
      ..size = Vector2(120, 100); //component size to be displayed
    add(breakButtonComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    //checking is the button is tapped
    if (breakButtonIsTapped) {
      Bike().onBreak(); //if tapped - apply break
    }
  }

//Acceleration Controller tap Event
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
