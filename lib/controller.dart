import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:run/Buttons/geardownbutton.dart';
import 'package:run/Buttons/gearupbutton.dart';
import 'package:run/bikegame.dart';
import 'package:run/Buttons/acceleratebutton.dart';
import 'package:run/Buttons/breakbutton.dart';

class Controller extends SpriteAnimationComponent with HasGameRef<MyGame> {
  late SpriteSheet spriteSheet; //declaring spritesheet variable
  @override
  Future<void> onLoad() async {
    double screenWidth = gameRef.size.x;
    double screenHeight = gameRef.size.y;
    add(AccelerationButton()
      ..size = Vector2(120, 100)
      ..position = Vector2(screenWidth - 200, screenHeight - 250));
    add(BreakButton()
      ..size = Vector2(120, 100)
      ..position = Vector2(screenWidth - 200, screenHeight - 150));
    add(GearUpButton()
          ..size = Vector2(120, 100)
      ..position = Vector2(200, screenHeight-250));
    add(GearDownButton()
              ..size = Vector2(120, 100)
      ..position = Vector2(200, screenHeight-150));
  }
}
