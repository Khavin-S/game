
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/controller.dart';

class GearUpButton extends Button with TapCallbacks{
  static int gear=0;
  static bool gearUpButtonIsTapped = false; //gearButtonComponent tap notifier
  late SpriteAnimation gearUpButtonAnimation; //declaring button
  late SpriteAnimationComponent gearUpButtonComponent; //declaring variable for component(specific image from spritesheet)
  @override
  Future<void> onLoad() async{
          //loading spritesheet
    spriteSheet = SpriteSheet(
        image: await Flame.images.load('finalsprite.png'),
        srcSize: Vector2(36, 36));
    gearUpButtonAnimation =
        spriteSheet.createAnimation(row: 4, stepTime: .1, to: 1);
    gearUpButtonComponent = SpriteAnimationComponent()
      ..animation = gearUpButtonAnimation
      ..size = Vector2(120, 100);
    add(gearUpButtonComponent);
  }

    @override
  void onTapDown(TapDownEvent event) {
    gearUp();
    super.onTapDown(event);
  }

  void gearUp(){
    if(gear<5){
    gear+=1;
    }
    print(gear);
  }

}