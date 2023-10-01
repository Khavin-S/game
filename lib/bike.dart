import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/bikegame.dart';
import 'package:run/track.dart';

class Bike extends SpriteAnimationComponent with HasGameRef<MyGame> {
  late double screenWidth = gameRef.size.x;
  late double screenHeight = gameRef.size.y;
  late SpriteSheet spriteSheet;
  static late SpriteAnimation bikeMovingAnimation;
  static late SpriteAnimation bikeIdleAnimation;
  static late SpriteAnimationComponent bikeComponent;
  static int speed = 0;
  static int gear = 0;
  late double distanceTravelled = 0;

  @override
  Future<void> onLoad() async {
    spriteSheet = SpriteSheet(
        image: await Flame.images.load('finalsprite.png'),
        srcSize: Vector2(36, 36));
    bikeIdleAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: .1, to: 1);
    bikeMovingAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: .2, to: 3);
    bikeComponent = SpriteAnimationComponent()
      ..animation = bikeIdleAnimation
      ..size = Vector2(120, 100)
      ..position = Vector2(screenWidth / 2 - 60, screenHeight / 2 - 50);
    add(bikeComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    speed = ((Track.track1.baseVelocity.x / 2500) * 100).toInt();
    print("gear = $gear speed = $speed");
  }

  void onAccelerate() {
    switch (gear) {
      case 0:
        if (Track.track1.baseVelocity.x > 0) {
          Track.track1.baseVelocity.x--;
          bikeComponent.animation = bikeMovingAnimation;
        } else {
          bikeComponent.animation = bikeIdleAnimation;
        }
        break;

      case 1:
        //if speed is high than 1st gear
        if (Track.track1.baseVelocity.x > 500) {
          bikeComponent.animation = bikeMovingAnimation;
          Track.track1.baseVelocity.x = 500;
        } else {
          bikeComponent.animation = bikeMovingAnimation;
          if (Track.track1.baseVelocity.x <= 500) {
            Track.track1.baseVelocity.x++;
          }
        }
        break;

      case 2:
        if (Track.track1.baseVelocity.x > 1000) {
          bikeComponent.animation = bikeMovingAnimation;
          Track.track1.baseVelocity.x = 1000;
        } else {
          if (Track.track1.baseVelocity.x < 500) {
            bikeComponent.animation = bikeMovingAnimation;
            Track.track1.baseVelocity.x += 0.50;
          } else {
            bikeComponent.animation = bikeMovingAnimation;
            if (Track.track1.baseVelocity.x < 1000) {
              Track.track1.baseVelocity.x++;
            }
          }
        }

        break;

      case 3:
        if (Track.track1.baseVelocity.x > 1500) {
          bikeComponent.animation = bikeMovingAnimation;
          Track.track1.baseVelocity.x = 1500;
        } else {
          if (Track.track1.baseVelocity.x < 500) {
            bikeComponent.animation = bikeMovingAnimation;
            Track.track1.baseVelocity.x += 0.25;
          } else if (Track.track1.baseVelocity.x >= 500 &&
              Track.track1.baseVelocity.x < 1000) {
            bikeComponent.animation = bikeMovingAnimation;
            Track.track1.baseVelocity.x += 0.75;
          } else {
            bikeComponent.animation = bikeMovingAnimation;
            if (Track.track1.baseVelocity.x < 1500) {
              Track.track1.baseVelocity.x++;
            }
          }
        }

        break;

      case 4:
        if (Track.track1.baseVelocity.x > 2000) {
          bikeComponent.animation = bikeMovingAnimation;
          Track.track1.baseVelocity.x = 2000;
        } else {
          if (Track.track1.baseVelocity.x < 500) {
            bikeComponent.animation = bikeMovingAnimation;
            Track.track1.baseVelocity.x += 0.15;
          } else if (Track.track1.baseVelocity.x >= 500 &&
              Track.track1.baseVelocity.x < 1000) {
            bikeComponent.animation = bikeMovingAnimation;
            Track.track1.baseVelocity.x += 0.50;
          } else if (Track.track1.baseVelocity.x >= 1000 &&
              Track.track1.baseVelocity.x < 1500) {
            bikeComponent.animation = bikeMovingAnimation;
            Track.track1.baseVelocity.x += 0.75;
          } else {
            bikeComponent.animation = bikeMovingAnimation;
            if (Track.track1.baseVelocity.x < 2000) {
              Track.track1.baseVelocity.x++;
            }
          }
        }

        break;

      case 5:
        if (Track.track1.baseVelocity.x < 500) {
          bikeComponent.animation = bikeMovingAnimation;
          Track.track1.baseVelocity.x += 0.10;
        } else if (Track.track1.baseVelocity.x >= 500 &&
            Track.track1.baseVelocity.x < 1000) {
          bikeComponent.animation = bikeMovingAnimation;
          Track.track1.baseVelocity.x += 0.30;
        } else if (Track.track1.baseVelocity.x >= 1000 &&
            Track.track1.baseVelocity.x < 1500) {
          bikeComponent.animation = bikeMovingAnimation;
          Track.track1.baseVelocity.x += 0.50;
        } else if (Track.track1.baseVelocity.x >= 1500 &&
            Track.track1.baseVelocity.x < 2000) {
          bikeComponent.animation = bikeMovingAnimation;
          Track.track1.baseVelocity.x += 0.75;
        } else {
          bikeComponent.animation = bikeMovingAnimation;
          if (Track.track1.baseVelocity.x < 2500) {
            Track.track1.baseVelocity.x++;
          }
        }

        break;
    }
  }

  void onBreak() {
    if (Track.track1.baseVelocity.x > 0) {
      Track.track1.baseVelocity.x = Track.track1.baseVelocity.x - 8;
      if (Track.track1.baseVelocity.x == 0) {
        bikeComponent.animation = bikeIdleAnimation;
      }
    } else {
      Track.track1.baseVelocity.x = 0;
      bikeComponent.animation = bikeIdleAnimation;
    }
  }

//if no button is touched after bikeComponent moves it will gradually reduce its speed until the speed becomes 0
  void onRelease() {
    if (Track.track1.baseVelocity.x > 0) {
      Track.track1.baseVelocity.x--;
      if (Track.track1.baseVelocity.x == 0) {
        bikeComponent.animation = bikeIdleAnimation;
      }
    } else {
      Track.track1.baseVelocity.x = 0;
      bikeComponent.animation = bikeIdleAnimation;
    }
  }

//bikeComponent gear
  void gearDown() {
    if (gear > 0) {
      gear--;
    }
    print(gear);
  }

  void gearUp() {
    if (gear < 5) {
      gear += 1;
    }
    print(gear);
  }
}
