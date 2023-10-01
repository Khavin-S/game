import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bikegame.dart';
import 'package:run/track.dart';

class Bike extends SpriteAnimationComponent with HasGameRef<MyGame> {
  late SpriteSheet spriteSheet;
  //sprite component with animation
  static late SpriteAnimationComponent bike;
  //animation
  static late SpriteAnimation characterWalkRightAnimation;
  static late SpriteAnimation characterIdleAnimation;
  //getting screen size
  late double screenWidth = gameRef.size.x;
  late double screenHeight = gameRef.size.y;

  late double speed ;
  static int gear = 0;

  @override
  Future<void> onLoad() async {
    //loading spritesheet
    spriteSheet = SpriteSheet(
        image: await Flame.images.load('finalsprite.png'),
        srcSize: Vector2(36, 36));
    //loading a specific movement animation from spritesheet
    characterIdleAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: .1, to: 1);
    characterWalkRightAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: .2, to: 3);
    //adding animation to be displayed
    bike = SpriteAnimationComponent()
      ..animation = characterIdleAnimation
      ..size = Vector2(120, 100)
      ..position = Vector2(screenWidth / 2 - 60, screenHeight / 2 - 50);
    add(bike);
  }

  @override
  void update(double dt) {
    super.update(dt);
    /*speed = (Track.track1.baseVelocity.x/2500)*140;
    print("gear = $gear speed = $speed");*/
    print("gear = $gear speed = ${Track.track1.baseVelocity.x}");
  }

  void onAccelerate() {
    switch (gear) {
        case 0:
        if (Track.track1.baseVelocity.x > 0) {
          Track.track1.baseVelocity.x--;
          bike.animation=characterWalkRightAnimation;
        }
        else{
          bike.animation=characterIdleAnimation;
        }
        break;



      case 1: 
        bike.animation = characterWalkRightAnimation;
        if (Track.track1.baseVelocity.x < 500) {
          Track.track1.baseVelocity.x++;
        }
        break;


      case 2:
      if(Track.track1.baseVelocity.x < 500){
        bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.50;
      }
      else{
        bike.animation = characterWalkRightAnimation;
        if (Track.track1.baseVelocity.x < 1000) {
          Track.track1.baseVelocity.x++;
        }
      }
        break;



      case 3:
        if(Track.track1.baseVelocity.x < 500){
        bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.25;
      }
      else if(Track.track1.baseVelocity.x >= 500 && Track.track1.baseVelocity.x < 1000){
          bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.75;
      }
      else{
        bike.animation = characterWalkRightAnimation;
        if (Track.track1.baseVelocity.x < 1500) {
          Track.track1.baseVelocity.x++;
        }
      }
      break;




      case 4:
      if(Track.track1.baseVelocity.x < 500){
        bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.15;
      }
      else if(Track.track1.baseVelocity.x >= 500 && Track.track1.baseVelocity.x < 1000){
          bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.50;
      }
            else if(Track.track1.baseVelocity.x >= 1000 && Track.track1.baseVelocity.x < 1500){
          bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.75;
      }
      else{
        bike.animation = characterWalkRightAnimation;
        if (Track.track1.baseVelocity.x < 2000) {
          Track.track1.baseVelocity.x++;
        }
        break;
      }


      case 5:
      if(Track.track1.baseVelocity.x < 500){
        bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.10;
      }
      else if(Track.track1.baseVelocity.x >= 500 && Track.track1.baseVelocity.x < 1000){
          bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.30;
      }
      else if(Track.track1.baseVelocity.x >= 1000 && Track.track1.baseVelocity.x < 1500){
          bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.50;
      }
      else if(Track.track1.baseVelocity.x >= 1500 && Track.track1.baseVelocity.x < 2000){
          bike.animation = characterWalkRightAnimation;
         Track.track1.baseVelocity.x+=0.75;
      }
      else{
        bike.animation = characterWalkRightAnimation;
        if (Track.track1.baseVelocity.x < 2500) {
          Track.track1.baseVelocity.x++;
        }
      }

        break;
    }
  }

  void onBreak() {
    if (Track.track1.baseVelocity.x > 0) {
      Track.track1.baseVelocity.x = Track.track1.baseVelocity.x - 8;
      if (Track.track1.baseVelocity.x == 0) {
        bike.animation = characterIdleAnimation;
      }
    } else {
      Track.track1.baseVelocity.x = 0;
      bike.animation = characterIdleAnimation;
    }
  }

//if no button is touched after bike moves it will gradually reduce its speed until the speed becomes 0
  void onRelease() {
    if (Track.track1.baseVelocity.x > 0) 
    {
      Track.track1.baseVelocity.x--;
      if (Track.track1.baseVelocity.x == 0) 
      {
        bike.animation = characterIdleAnimation;
      }
    }
    else
    {
            Track.track1.baseVelocity.x=0;
            bike.animation = characterIdleAnimation;
    }
  }

//bike gear
  void gearDown() {
    if (gear > 0) {
      gear--;
    }
    print(gear);
  }

  void gearUp() {
    if (gear < 5) {
      gear += 1;
    }
    print(gear);
  }
}
