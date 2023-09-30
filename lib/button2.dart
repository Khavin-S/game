import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bike.dart';
import 'package:run/bikegame.dart';
import 'package:run/button1.dart';

class Button2 extends SpriteAnimationComponent with TapCallbacks,HasGameRef<MyGame>{
  

  late SpriteSheet spriteSheet;
  late SpriteAnimationComponent button2;
  late SpriteAnimation break_button;

  @override
  Future<void> onLoad() async{
  
    //loading spritesheet
     spriteSheet = SpriteSheet(
    image: await Flame.images.load('finalsprite.png'), srcSize: Vector2(36, 36));

    //loading a specific movement animation from spritesheet
     break_button=spriteSheet.createAnimation(row: 4, stepTime: .1, from: 1,to: 2);


    //adding animation to be displayed
    button2 = SpriteAnimationComponent()
      ..animation = break_button
      ..size = Vector2(120, 100);

      add(button2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(!Button1.isTapped){
      Bike().onStop();
    }
  }
  
@override
  void onTapDown(TapDownEvent event) {
    Button1.isTapped=false;
    super.onTapDown(event);
  }

}