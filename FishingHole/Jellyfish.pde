class JellyFish extends Fish {
  int size = int(random(20, 100));
  float jellyVel = 0.75;
  color c = color(255, 255, 255, 75);
  int numTents = 5;
  int tentLen = 2*size;

  ArrayList<Point> tents = new ArrayList<Point>();

  ArrayList<Point> caughtTents = new ArrayList<Point>();



  JellyFish(float xx, float yy) {
    super(xx, yy);
    updateVel(jellyVel);
    float cur = float(size)/(numTents+1);
    float step = cur;
    for (int i = 0; i < numTents; ++i) {
      tents.add(new Point(x, y-size/2.0+cur));
      caughtTents.add(new Point(x-size/2.0+cur, y+size/2.0));
      cur += step;
    }
  }


  void display() {
    fill(c);
    drawBody();
    strokeWeight(2);
    stroke(c);
    drawTents();
    strokeWeight(1);
    stroke(0);
  }

  void drawBody() {
    if (!caught) {
      if (movingRight) {
        arc(x, y, size, size, -PI/2, PI/2);
      } else {
        arc(x, y, size, size, -3*PI/2, -PI/2);
      }
    } else {
      arc(x, y-size/2.0, size, size, -PI, 0);
    }
  }


  void drawTents() {
    println(tents.size());
    if (!caught) {
      if (movingRight) {
        tentLen *= -1;
      } 
      for (Point tent : tents) {
        strokeWeight(2);
        stroke(c);
        line(tent.x, tent.y, tent.x+tentLen, tent.y);
      }
      tentLen = abs(tentLen);
    } else {
      for (Point tent : caughtTents) {
        line(tent.x, tent.y, tent.x, tent.y+tentLen);
      }
    }
  }



  boolean intersectLure(FishingLure l) {
    float xdist = l.intersectPoint.x-x;
    float ydist = l.intersectPoint.y-y;
    if ((movingRight && l.intersectPoint.x >= x) || (!movingRight && l.intersectPoint.x <= x)) {
      if (abs(xdist) <= size/2.0 && abs(ydist) <= size/2.0) {
        if (l.caughtFish()) {
          caught = true;
          lure = l;
          l.caughtFish = true;
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }


  void move() {
    super.move();
    if (!caught) {
      for (Point tent : tents) {
        tent.x += vel;
      }
    } else {
      float cur = float(size)/(numTents+1);
      float step = cur;
      for (Point tent : caughtTents) {
        tent.x = x-size/2.0+cur;
        tent.y = y-size/2.0;
        cur += step;
      }
    }
  }
}