class SeaWeed extends SeaLife {
  int w = 15;
  int h = 75;
  SeaWeed(float xx, float yy) {
    x = xx;
    y = yy;
  }
  void display() {
    strokeWeight(5);
    stroke(color(0, 150, 0));
    curve(x-25, y, x, y, x+w, y-h, x+w+25, y-h);
    curve(x+25, y, x, y, x-w, y-h, x-w-25, y-h);
    line(x, y, x, y-h);
    strokeWeight(1);
    stroke(0);
  }
}