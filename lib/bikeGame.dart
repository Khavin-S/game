import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:run/bike.dart';
import 'package:run/button1.dart';
import 'package:run/button2.dart';
import 'package:run/track.dart';


class MyGame extends FlameGame with HasGameRef{

@override
  Future<void> onLoad() async{
    double screenWidth=gameRef.size.x;
    double screenHeight=gameRef.size.y;
    add(Track());
    add(Bike());
           add(Button1()
    ..size=Vector2(100, 100)
    ..position=Vector2(screenWidth-250, screenHeight-300));
    add(Button2()
    ..size=Vector2(100, 100)
    ..position=Vector2(screenWidth-250, screenHeight-200));

  }
}