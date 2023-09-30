import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:run/bikegame.dart';
import 'package:run/button1.dart';
import 'package:run/button2.dart';

class Button extends SpriteAnimationComponent with HasGameRef<MyGame>{
  late SpriteSheet spriteSheet;  //declaring spritesheet variable
  @override
  Future<void> onLoad() async{
    double screenWidth=gameRef.size.x;
    double screenHeight=gameRef.size.y;
    add(Button1()
    ..size=Vector2(120, 100)
    ..position=Vector2(screenWidth-200, screenHeight-250));
      add(Button2()
    ..size=Vector2(120, 100)
    ..position=Vector2(screenWidth-200, screenHeight-150));
  }
}
