import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: BallGame()));
}

class Ball extends PositionComponent
    with CollisionCallbacks, HasGameRef<BallGame> {
  static const double radius = 10.0;
  static final Paint _paint = Paint()..color = Colors.blue;
  final Vector2 velocity;

  Ball(Vector2 position)
      : velocity = (Vector2.random() - Vector2.all(0.5)).normalized() * 100,
        super(position: position, size: Vector2.all(radius * 2));

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox.relative(Vector2.all(1), parentSize: size));
  }

  @override
  void update(double dt) {
    position.add(velocity * dt);

    if (position.x < 0 ||
        position.x > gameRef.size.x ||
        position.y < 0 ||
        position.y > gameRef.size.y) {
      removeFromParent();
    }

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(const Offset(radius, radius), radius, _paint);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Ball) {
      velocity.negate();
      other.velocity.negate();
    }
    super.onCollision(intersectionPoints, other);
  }
}

class BallGame extends FlameGame with HasCollisionDetection, TapDetector {
  @override
  void onTapDown(TapDownInfo info) {
    add(Ball(info.eventPosition.global));
  }

  @override
  Color backgroundColor() => Colors.white;
}
