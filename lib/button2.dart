import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bike.dart';
import 'package:run/button.dart';

class Button2 extends Button with TapCallbacks{
  

  bool breakButtonIsTapped=false; //gas_button tap notifier
  late SpriteAnimation breakButtonAnimation;
  late SpriteAnimationComponent breakButtonComponent;


  @override
  Future<void> onLoad() async{
            //loading spritesheet
     spriteSheet = SpriteSheet(
    image: await Flame.images.load('finalsprite.png'), srcSize: Vector2(36, 36));
        //loading a specific movement animation from spritesheet
     breakButtonAnimation=spriteSheet.createAnimation(row: 4, stepTime: .1, from: 1,to: 2);
  
    //adding animation to be displayed
    breakButtonComponent = SpriteAnimationComponent()
      ..animation = breakButtonAnimation
      ..size = Vector2(120, 100);

      add(breakButtonComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(breakButtonIsTapped){
      Bike().onBreak();
    }
  }
  
//Acceleration Button tap Event
@override
  void onTapDown(TapDownEvent event) {
    breakButtonIsTapped=true;
    super.onTapDown(event);
  }
  @override
  void onTapUp(TapUpEvent  event) {
    breakButtonIsTapped=false;
  }
    @override
  void onTapCancel(TapCancelEvent event) {
    breakButtonIsTapped = false;
  }

}