import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bikegame.dart';
import 'package:run/track.dart';

class Bike extends SpriteAnimationComponent with HasGameRef<MyGame>{
  
  late SpriteSheet spriteSheet;
  //sprite component with animation
  static late SpriteAnimationComponent bike;
  //animation
  static late SpriteAnimation characterWalkRightAnimation;
  static late SpriteAnimation characterIdleAnimation;
  //getting screen size
  late double screenWidth=gameRef.size.x;
  late double screenHeight=gameRef.size.y;


  @override
  Future<void> onLoad() async{
  
    //loading spritesheet
     spriteSheet = SpriteSheet(
    image: await Flame.images.load('finalsprite.png'), srcSize: Vector2(36, 36));
    //loading a specific movement animation from spritesheet
     characterIdleAnimation=spriteSheet.createAnimation(row: 0, stepTime: .1, to: 1);
    characterWalkRightAnimation = spriteSheet.createAnimation(row: 1, stepTime: .15, to: 3);
    //adding animation to be displayed
    bike = SpriteAnimationComponent()
      ..animation = characterIdleAnimation
      ..size = Vector2(120, 100)
            ..position = Vector2(screenWidth/2-60,screenHeight/2-50);
      add(bike);
  }
  @override
  void update(double dt) {
        super.update(dt);

  }

  void onMove(){
      bike.animation=characterWalkRightAnimation;
      Track.track1.baseVelocity.x=100;
  }
  void onStop(){
        bike.animation=characterIdleAnimation;
        Track.track1.baseVelocity.x=0;
  }

}