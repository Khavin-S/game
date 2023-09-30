import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/Buttons/gearupbutton.dart';
import 'package:run/controller.dart';


class GearDownButton extends Button with TapCallbacks{

   bool gearDownButtonIsTapped = false; //gearButtonComponent tap notifier
  late SpriteAnimation gearDownButtonAnimation; //declaring button
  late SpriteAnimationComponent gearDownButtonComponent; //declaring variable for component(specific image from spritesheet)

  @override
  Future<void> onLoad() async{
    spriteSheet = SpriteSheet(
        image: await Flame.images.load('finalsprite.png'),
        srcSize: Vector2(36, 36));

    gearDownButtonAnimation =
        spriteSheet.createAnimation(row: 4, stepTime: .1, to: 1);
    gearDownButtonComponent = SpriteAnimationComponent()
      ..animation = gearDownButtonAnimation
      ..size = Vector2(120, 100);
    add(gearDownButtonComponent);
    
  }

      @override
  void onTapDown(TapDownEvent event) {
    gearDown();
      super.onTapDown(event);
  }

  void gearDown(){
    if(GearUpButton.gear>0) {
      GearUpButton.gear--;
    }
    print(GearUpButton.gear);
  }
}