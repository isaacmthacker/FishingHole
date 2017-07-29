class Fish extends SeaLife {
  color c;
  float vel;
  boolean movingRight = true;
  int fishLen = 100;
  int fishWid = 35;
  int numRowsScales = 5;
  float scaleSize = fishWid/float(numRowsScales);
  boolean caught = false;
  FishingLure lure;
  Fish(float xx, float yy) {
    x = xx;
    y = yy;
    int len = 6;
    color[] cols = {
      color(255, 0, 0), 
      color(0, 255, 0), 
      color(255, 255, 0), 
      color(255, 0, 255), 
      color(255, 165, 0), 
      color(30, 144, 255)
    };
    c = cols[int(random(100))%len];

    vel = 1.5;
    if (x > width/2.0) {
      movingRight = false;
      vel *= -1;
    }
  }

  void display() {
    //noStroke();
    fill(c);
    drawBody();
    drawTail();
    drawEye();
  }

  void drawBody() {
    if (!caught) {
      ellipse(x, y, fishLen, fishWid);
    } else {
      ellipse(x, y, fishWid, fishLen);
    }
  }

  void drawTail() {
    final int tailSize = 10;
    if (!caught) {
      if (movingRight) {
        triangle(x-fishLen/2.0, y, x-fishLen/2.0-tailSize, y-fishWid, x-fishLen/2.0-tailSize, y+fishWid);
      } else {
        triangle(x+fishLen/2.0, y, x+fishLen/2.0+tailSize, y-fishWid, x+fishLen/2.0+tailSize, y+fishWid);
      }
    } else {
      float yPos = y+fishLen/2.0;
      triangle(x, yPos, x-fishWid/2.0-tailSize, yPos+tailSize, x+fishWid/2.0+tailSize, yPos+tailSize);
    }
  }

  void drawEye() {
    fill(0);
    if (!caught) {
      if (movingRight) {
        ellipse(x+fishLen/2.0-10, y-2.5, 5, 5);
      } else {
        ellipse(x-fishLen/2.0+10, y-2.5, 5, 5);
      }
    } else {
      if (movingRight) {
        ellipse(x-2.5, y-fishLen/2.0+10, 5, 5);
      } else {
        ellipse(x+2.5, y-fishLen/2.0+10, 5, 5);
      }
    }
  }

  void updateVel(float newVel) {
    if (vel < 0) {
      vel = -abs(newVel);
    } else {
      vel = abs(newVel);
    }
  }

  boolean intersectLure(FishingLure l) {
    if (abs(l.intersectPoint.x -x) <= fishLen/2.0) {
      if (abs(l.intersectPoint.y-y) <= fishWid/2.0) {
        if (l.caughtFish()) {
          caught = true;
          lure = l;
          l.caughtFish = true;
        }
      }
    }
    return false;
  }

  void move() {
    if (!caught) {
      x += vel;
    } else {
      lure.update();
      x = lure.intersectPoint.x;
      y = lure.intersectPoint.y+fishLen/2.0;
    }
  }
}