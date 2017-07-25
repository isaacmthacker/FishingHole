class Fish extends SeaCritter {
  color c;
  float vel;
  boolean movingRight = true;
  int fishLen = 100;
  int fishWid = 35;
  Fish(float xx, float yy) {
    x = xx;
    y = yy;
    int len = 3;
    color[] cols = {
      color(255, 0, 0), color(0, 255, 0), 
      color(255, 255, 0)};
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
    ellipse(x, y, fishLen, fishWid);
    if (movingRight) {
      fill(c);
      triangle(x-fishLen/2.0, y, x-fishLen/2.0-10, y-fishWid, x-fishLen/2.0-10, y+fishWid);
      fill(0);
      ellipse(x+fishLen/2.0-10, y-2.5, 5, 5);
    } else {
      fill(c);
      triangle(x+fishLen/2.0, y, x+fishLen/2.0+10, y-fishWid, x+fishLen/2.0+10, y+fishWid);
      fill(0);
      ellipse(x-fishLen/2.0+10, y-2.5, 5, 5);
    }
  }

  void move() {
    x += vel;
  }
}