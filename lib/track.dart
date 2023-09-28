import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';

class Track extends ParallaxComponent with TapCallbacks {
  static late Parallax track1;

  @override
  FutureOr<void> onLoad() async {
    track1= await gameRef.loadParallax(
      [
        ParallaxImageData('sky.png'),
      ],
      baseVelocity: Vector2(0, 0),      
    );
  parallax=track1;
  }


}