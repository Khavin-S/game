import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class Obstacles extends SpriteAnimationComponent {
  late SpriteSheet spriteSheet;
  late SpriteAnimation obstacleAnimation;
  late SpriteAnimationComponent obstacleComponent;
  @override
  Future<void> onLoad() async {
    spriteSheet = SpriteSheet(
        image: await Flame.images.load('finalsprite.png'),
        srcSize: Vector2(36, 36));
    obstacleAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: .1, to: 1);
    obstacleComponent = SpriteAnimationComponent()
      ..animation = obstacleAnimation
      ..size = Vector2(120, 100)
      ..position = Vector2(100, 100);
    add(obstacleComponent);
  }
}
