import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bike1.dart';


class AccelerationButton extends SpriteAnimationComponent with TapCallbacks{

late SpriteSheet spriteSheet;
late SpriteAnimation accelerateButtonAnimation;
late SpriteAnimationComponent accelerationButtonComponent;
bool accelerateButtonIsTapped=false;

onLoad() async{
  spriteSheet=SpriteSheet(image: await Flame.images.load("finalsprite.png"), srcSize: Vector2(36,36));
  accelerateButtonAnimation=spriteSheet.createAnimation(row: 4, stepTime: .1, to: 1);
  accelerationButtonComponent=SpriteAnimationComponent()
    ..animation=accelerateButtonAnimation
    ..size=Vector2(120, 100);
  add(accelerationButtonComponent);
}

@override
  void update(double dt) {
    super.update(dt);
    if(accelerateButtonIsTapped){
      Bike1().onMove(dt);
    }
    else{
      Bike1().onRelease(dt);
    }
  }


  @override
  void onTapDown(TapDownEvent event) {
    accelerateButtonIsTapped = true;
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    accelerateButtonIsTapped = false;
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    accelerateButtonIsTapped = false;
  }

}