import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:run/Buttons/geardownbutton.dart';
import 'package:run/Buttons/gearupbutton.dart';
import 'package:run/bikegame.dart';
import 'package:run/Buttons/acceleratebutton.dart';
import 'package:run/Buttons/breakbutton.dart';

class Controller extends SpriteAnimationComponent with HasGameRef<MyGame> {
  late SpriteSheet spriteSheet; //declaring spritesheet variable
     double screenHeight=0;
     double screenWidth=0;
  @override
  Future<void> onLoad() async {
  double screenHeight = gameRef.size.y;
   double screenWidth = gameRef.size.x;
    add(AccelerationButton()
      ..size = Vector2(120, 100)
      ..position = Vector2(screenWidth - 200, screenHeight - 250));
    add(BreakButton()
      ..size = Vector2(120, 100)
      ..position = Vector2(screenWidth - 200, screenHeight - 150));
    add(GearUpButton()
          ..size = Vector2(120, 100)
      ..position = Vector2(200-120, screenHeight-250));
    add(GearDownButton()
              ..size = Vector2(120, 100)
      ..position = Vector2(200-120, screenHeight-150));
  }
}
