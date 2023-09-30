import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bike.dart';
import 'package:run/bikegame.dart';




class Button1 extends SpriteAnimationComponent with TapCallbacks,HasGameRef<MyGame>{
  late SpriteSheet spriteSheet;  //declaring spritesheet variable
  late SpriteAnimationComponent gas_button;  //declaring variable for component(specific image from spritesheet)
  late SpriteAnimation gas_button_animation;//declaring button animation
    static bool button_1_istapped=false; //gas_button tap notifier


  @override
  Future<void> onLoad() async{
  
    //loading spritesheet
     spriteSheet = SpriteSheet(
    image: await Flame.images.load('finalsprite.png'), srcSize: Vector2(36, 36));

    //loading a specific movement animation from spritesheet
     gas_button_animation=spriteSheet.createAnimation(row: 4, stepTime: .1, to: 1);

    //adding animation to be displayed to button component 
    gas_button = SpriteAnimationComponent()
      ..animation = gas_button_animation
      ..size = Vector2(120, 100);

      add(gas_button);
  }

  @override
  void update(double dt) {
    super.update(dt);
    //checking whether the button is taapped
    if(button_1_istapped){
      //if tapped
      Bike().onAccelerate();
    }
    else{
      //if button released
      Bike().onRelease();
    }
  }
  

//Acceleration Button tap Event
@override
  void onTapDown(TapDownEvent event) {
    button_1_istapped=true;
    super.onTapDown(event);
  }
  @override
  void onTapUp(TapUpEvent  event) {
    button_1_istapped=false;
  }
    @override
  void onTapCancel(TapCancelEvent event) {
    button_1_istapped = false;
  }


}