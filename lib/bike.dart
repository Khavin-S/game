import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bikeGame.dart';
import 'package:run/button.dart';

class Bike extends SpriteAnimationComponent with HasGameRef<MyGame>{


  late SpriteSheet spriteSheet;

  //sprite component with animation
  late SpriteAnimationComponent bike;


  //animation
  late SpriteAnimation characterWalkRightAnimation;
  late SpriteAnimation characterIdleAnimation;

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
        if(Button.isTapped){
bike.animation=characterWalkRightAnimation;
        }
        else{

         bike.animation=characterIdleAnimation;
        }
  }
}