import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bike.dart';
import 'package:run/bikegame.dart';
import 'package:run/button2.dart';
import 'package:run/track.dart';




class Button1 extends SpriteAnimationComponent with TapCallbacks,HasGameRef<MyGame>{
  static bool isTapped=false;
  late SpriteSheet spriteSheet;
  late SpriteAnimationComponent button1;
  late SpriteAnimation gas_button;

  @override
  Future<void> onLoad() async{
  
    //loading spritesheet
     spriteSheet = SpriteSheet(
    image: await Flame.images.load('finalsprite.png'), srcSize: Vector2(36, 36));

    //loading a specific movement animation from spritesheet
     gas_button=spriteSheet.createAnimation(row: 4, stepTime: .1, to: 1);


    //adding animation to be displayed
    button1 = SpriteAnimationComponent()
      ..animation = gas_button
      ..size = Vector2(120, 100);

      add(button1);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(isTapped){
      Bike().onMove();
    }
  }
  
@override
  void onTapDown(TapDownEvent event) {
    isTapped=true;
    super.onTapDown(event);
  }

}