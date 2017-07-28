class Jellyfish extends SeaLife {
  int size = 50;
  int numLegs = int(size*0.1);
  int legLen = 50;
  float[][] legPoints = new float[numLegs][4];
  Jellyfish() {
    x = -size;
    if (random(1) < 0.5) {
      x = width+size;
    }

    x = width/2.0;
    y = random(size, height-size);

    float cur = x-size/2.0;
    float step = float(size)/(numLegs-1);
    for (int i = 0; i < numLegs; ++i) {
      //line(cur, y, cur, y+legLen);
      Point[] pnts = {new Point(cur+negRand(100), y+negRand(100)), 
        new Point(cur, y), 
        new Point(cur, y+legLen), 
        new Point(cur+negRand(100), y+negRand(100))};
      //curve(cur+negRand(100), y+negRand(100), cur, y, cur, y+legLen, cur+negRand(100), y+negRand(100));
      cur += step;
    }
  }

  private float negRand(float range) {
    float ret = random(range);
    if (random(1) < 0.5) {
      ret *= -1;
    }
    return ret;
  }

  void display() {
    fill(0);
    stroke(0);
    arc(x, y, size, size, -PI, 0);
  }
  void move() {
    //todo
  }
}