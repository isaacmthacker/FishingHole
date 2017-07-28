class StarFish extends SeaLife {
  int size = 30;
  float[][] pnts = new float[5][2];
  float[][] midPnts = new float[5][2];

  float[][] path = new float[10][2];
  StarFish() {
    x = random(width);
    y = random(height-sandHeight+size/2.0, height-size/2.0);
    float angleOffset = PI/12.0;
    float cur = PI/2.0 + angleOffset;
    float step = 2*PI/5.0;
    final float magicConstant = 2.75;
    for (int i = 0; i < 5; ++i) {
      pnts[i][0] = x+size*cos(cur);
      pnts[i][1] = y-size*sin(cur);
      cur += step;
    }
    step = 2*PI/5.0;
    cur = PI/2.0+2*PI/10.0 + angleOffset;
    for (int i = 0; i < 5; ++i) {
      midPnts[i][0] = x+size/magicConstant*cos(cur);
      midPnts[i][1] = y-size/magicConstant*sin(cur);
      cur += step;
    }

    int idx = 0;
    for (int i = 0; i < 5; ++i) {
      path[idx] = pnts[i];
      ++idx;
      path[idx] = midPnts[i];
      ++idx;
    }
  }

  void display() {
    fill(color(204, 85, 0));
    beginShape();
    for (float[] pnt : path) {
      vertex(pnt[0], pnt[1]);
    }
    vertex(path[0][0], path[0][1]);
    endShape();
  }
}