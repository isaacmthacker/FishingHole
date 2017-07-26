class Bubbles extends SeaLife {
  float vel = -2.5;
  int maxSize = 30;
  float bubRectW = 1.5*maxSize;
  int bubRectH = 4*maxSize;
  float cx;
  float cy;

  int numBubbles = int(random(15, 20));
  //x,y,size
  float[][] bubbles = new float[numBubbles][3];
  Bubbles() {
    cx = random(bubRectW, width-bubRectW);
    cy = height+2*bubRectH;
    for (int i = 0; i < numBubbles; ++i) {
      bubbles[i] = createBubble();
    }
  }

  float[] createBubble() {
    float s = random(maxSize);
    float x = random(bubRectW-s/2.0);
    float y = random(bubRectH-s/2.0);
    if (random(1) < 0.5) {
      x *= -1;
    }
    if (random(1) < 0.5) {
      y *= -1;
    }
    float[] ret = {cx+x, cy+y, s};
    return ret;
  }


  void display() {
    stroke(255);
    strokeWeight(2);
    noFill();
    for (float[] bub : bubbles) {
      ellipse(bub[0], bub[1], bub[2], bub[2]);
    }
    stroke(0);
    strokeWeight(1);
    //println(cy);
  }

  void move() {
    for (float[] bub : bubbles) {
      bub[1] += vel;
    }
    cy += vel;
  }
}