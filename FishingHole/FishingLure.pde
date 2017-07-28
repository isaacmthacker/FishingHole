class FishingLure {
  float x;
  float y;
  int lureSize = 25;
  Point intersectPoint;
  float depth = 0;
  int vel = 3;
  boolean movingDown = false;
  boolean movingUp = false;
  FishingLure() {
    x = mouseX;
    y = 0;
    intersectPoint = new Point(x-lureSize/2.0, y+1.5*lureSize);
  }

  void display() {
    y += depth;
    line(x, 0, x, depth);
    strokeWeight(3);
    line(x, y, x, y+lureSize);
    noFill();
    arc(x, y+1.5*lureSize, lureSize, lureSize, -PI/2, PI);
    strokeWeight(1);
    y -= depth;
  }

  boolean isMoving() {
    if (movingDown || movingUp) {
      println("moving");
    }
    return movingDown || movingUp;
  }

  void move() {
    depth += vel;
    //y += depth;
  }

  void update() {
    x = mouseX;
  }

  void clicked() {
    if (!isMoving()) {
      cast();
    } else {
      reel();
    }
  }

  void cast() {
    movingDown = true;
    vel = abs(vel);
  }

  void reel() {
    println("reel");
    movingDown = false;
    movingUp = true;
    vel *= -1;
    println(movingDown, movingUp, vel);
  }

  void run() {
    if (isMoving()) {
      move();
    }
    if (y+depth <= 0) {
      movingUp = false;
      vel = abs(vel);
    }
    update();
    display();
  }
}