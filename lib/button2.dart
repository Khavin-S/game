import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bike.dart';
import 'package:run/bikegame.dart';

class Button2 extends SpriteAnimationComponent with TapCallbacks,HasGameRef<MyGame>{
  

  late SpriteSheet spriteSheet;
  late SpriteAnimationComponent button2;
  late SpriteAnimation breakButton;
      static bool button_2_istapped=false; //gas_button tap notifier


  @override
  Future<void> onLoad() async{
  
    //loading spritesheet
     spriteSheet = SpriteSheet(
    image: await Flame.images.load('finalsprite.png'), srcSize: Vector2(36, 36));

    //loading a specific movement animation from spritesheet
     breakButton=spriteSheet.createAnimation(row: 4, stepTime: .1, from: 1,to: 2);


    //adding animation to be displayed
    button2 = SpriteAnimationComponent()
      ..animation = breakButton
      ..size = Vector2(120, 100);

      add(button2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(button_2_istapped){
      Bike().onBreak();
    }
  }
  
//Acceleration Button tap Event
@override
  void onTapDown(TapDownEvent event) {
    button_2_istapped=true;
    super.onTapDown(event);
  }
  @override
  void onTapUp(TapUpEvent  event) {
    button_2_istapped=false;
  }
    @override
  void onTapCancel(TapCancelEvent event) {
    button_2_istapped = false;
  }

}