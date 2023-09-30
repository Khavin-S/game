import 'dart:async';
import 'package:flame/game.dart';
import 'package:run/bike.dart';
import 'package:run/controller.dart';
import 'package:run/track.dart';


class MyGame extends FlameGame{
@override
  Future<void> onLoad() async{
    await add(Track());
    await add(Bike());
    await add(Controller()); 
  }
}