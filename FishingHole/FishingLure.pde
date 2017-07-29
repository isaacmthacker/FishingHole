class FishingLure {
  float x;
  float y;
  final int lureSize = 25;
  Point intersectPoint;
  int vel = 5;
  boolean movingDown = false;
  boolean movingUp = false;
  boolean caughtFish = false;
  FishingLure() {
    x = mouseX;
    y = 0;
    intersectPoint = new Point(x-lureSize/2.0, y+1.5*lureSize);
  }

  void display() {
    line(x, 0, x, y);
    strokeWeight(3);
    line(x, y, x, y+lureSize);
    noFill();
    arc(x, y+1.5*lureSize, lureSize, lureSize, -PI/2, PI);
    strokeWeight(1);
  }

  boolean isMoving() {
    return movingDown || movingUp;
  }

  void move() {
    y += vel;
    if (y >= height-sandHeight) {
      reel();
    }
  }

  void update() {
    x = mouseX;
    intersectPoint.x = x-lureSize/2.0;
    intersectPoint.y = y+1.5*lureSize;
  }

  void clicked() {
    if (!isMoving()) {
      cast();
    } else if (!movingUp) {
      reel();
    }
  }

  void cast() {
    movingDown = true;
    vel = abs(vel);
  }

  void reel() {
    movingDown = false;
    movingUp = true;
    vel *= -1;
  }

  boolean caughtFish() {
    if (movingDown) {
      return false;
    } else {
      if (!caughtFish) {
        return true;
      } else {
        return false;
      }
    }
  }

  void release() {
    caughtFish = false;
  }

  void run() {
    if (isMoving()) {
      move();
    }
    if (y <= 0) {
      movingUp = false;
      vel = abs(vel);
    }
    update();
    display();
  }
}