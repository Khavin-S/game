import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:run/track.dart';

class Bike1 extends SpriteAnimationComponent with HasGameRef {
  late SpriteSheet spriteSheet;
  late SpriteAnimation bikeIdleAnimation;
  late SpriteAnimation bikeMoveAnimation;
  late SpriteAnimationComponent bikeComponent;

  static double acceleration = 0;
  static double speed = 0;
  late double speedInGame;
  static late double trackDistance;
  static double gear = 0;


  @override
  onLoad() async{
      spriteSheet=SpriteSheet(image: await Flame.images.load("finalsprite.png"), srcSize: Vector2(36,36));
      bikeIdleAnimation=spriteSheet.createAnimation(row: 0, stepTime: .1, to: 1);
      bikeMoveAnimation=spriteSheet.createAnimation(row: 1, stepTime: .20, to: 3);
      bikeComponent=SpriteAnimationComponent()
      ..animation=bikeIdleAnimation
      ..size=Vector2(120, 100)
      ..position=Vector2(gameRef.size.x/2-60, gameRef.size.y/2-50);
      add(bikeComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    speedInGame = speed*30*30;
    trackDistance = speedInGame * dt;
    Track.track1.baseVelocity.x = trackDistance;
  }

  void onMove(double dt){
      switch(gear){
        case 0:
        gear0Logics(dt);
        case 1:
        gear1Logics(dt);
        break;
        case 2:
        gear2Logics(dt);
        break;
        case 3:
        gear3Logics(dt);
        break;
        case 4:
        gear4Logics(dt);
        break;
        case 5:
        gear5Logics(dt);
        break;
      }
  }

  void onBreak(double dt){
    speed-=(speed+8)*dt;
  }

  void onRelease(double dt){
    if(speed>0){
    speed-=(speed+1)*dt;
    acceleration=0;
    }
    else{
      speed=0;
    }
  }

  void gear0Logics(double dt){
    if(speed>0){
    speed-=(speed+1)*dt;
    }
    else{
      speed=0;
    }
  }

  void gear1Logics(double dt){
    if(speed>20){
      speed=20;
      acceleration=0;
    }
    else{
      if(speed<20){
      acceleration+=(acceleration+1)*dt;
      speed+=acceleration*dt;
            print("Speed = ${speed.toInt()}");
      print("Acceleration ${acceleration.toInt()}");
      }
      else{
      acceleration=0;
      }
    }
  }

  void gear2Logics(double dt){
      if(speed>40){
        speed=40;
        acceleration=0;
      }
      else{
      if(speed<20){
      acceleration+=(acceleration+0.25)*dt;
      speed+=acceleration*dt;
      }
      else{
      if(speed>=20 && speed<40){
      acceleration+=(acceleration+1)*dt;
      speed+=acceleration*dt;
      }
      else{
      acceleration=0;
    }
    }
    }
}

  void gear3Logics(double dt){
    if(speed>60){
      speed=60;
      acceleration=0;
    }
    else{
    if(speed<40){
      if(speed<20){
      acceleration+=(acceleration+0.25)*dt;
      speed+=acceleration*dt;
      }
      else if(speed>=20 && speed<40){
      acceleration+=(acceleration+0.75)*dt;
      speed+=acceleration*dt;
      }
    }
    else{
      if(speed>=40 && speed<60){
      acceleration+=(acceleration+1)*dt;
      speed+=acceleration*dt;
    }
      else{
      acceleration=0;
    }
    }

    }

  }

  void gear4Logics(double dt){
    if(speed>90){
      speed=90;
      acceleration=0;
    }
    else{
      if(speed<60){
          if(speed<20){
      acceleration+=(acceleration+0.10)*dt;
      speed+=acceleration*dt;
            print(acceleration.toInt());

          }
          else if(speed>=20 && speed<40){
      acceleration+=(acceleration+0.35)*dt;
      speed+=acceleration*dt;
            print(acceleration.toInt());

          }
          else if(speed>=40 && speed<60){
      acceleration+=(acceleration+0.75)*dt;
      speed+=acceleration*dt;
            print(acceleration.toInt());

          }
      }
      else{
      if(speed>=60 && speed<90){
      acceleration+=(acceleration+1)*dt;
      speed+=acceleration*dt;
            print(acceleration.toInt());

    }
        else{
      acceleration=0;
    }
      }
    }
  }

  void gear5Logics(double dt){
    if(speed < 90){
          if(speed<20){
      acceleration+=(acceleration+0.05)*dt;
      speed+=acceleration*dt;
            print("Speed = ${speed.toInt()}");
      print("Acceleration ${acceleration.toInt()}");
          }
          else if(speed>=20 && speed<40){
      acceleration+=(acceleration+0.05)*dt;
      speed+=acceleration*dt;
                  print(acceleration.toInt());

          }
          else if(speed>=40 && speed<60){
      acceleration+=(acceleration+0.05)*dt;
      speed+=acceleration*dt;
                  print(acceleration.toInt());

          }
          else if(speed>=60 && speed<90){
      acceleration+=(acceleration+0.75)*dt;
      speed+=acceleration*dt;
                  print(acceleration.toInt());

          }
    }
    else{
      if(speed>=90 && speed<120){
      acceleration+=(acceleration+1)*dt;
      speed+=acceleration*dt;
      print(acceleration.toInt());
    }
    }
    

  }



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