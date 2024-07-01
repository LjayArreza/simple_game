# Simple Ball Game Using Flame Library

## Introduction
This project is a simple game developed using the Flame library in Dart. The game allows players to create balls by tapping on the screen. These balls move in random directions, detect and respond to collisions with other balls, and are removed when they move off the screen.

## Requirements
1. **Screen Interaction:**
   - The player should be able to create a small ball by clicking on the screen.

2. **Ball Behavior:**
   - Upon clicking the screen, a new ball should spawn at the click location and move in a random direction.
   - Balls should move at a constant speed.

3. **Collisions:**
   - If two balls collide, both should change their direction to the opposite.
   - Collision detection should work correctly even with multiple balls on the screen.

4. **Removing Balls:**
   - If a ball moves outside the screen, it should be removed from the game.

## Implementation

### 1. Project Setup
Ensure you have the Flame package installed in your Flutter project. Add Flame to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flame: ^1.0.0
