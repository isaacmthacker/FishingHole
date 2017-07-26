class FishSchool {
  Fish[] fish;
  float sandHeight;
  FishSchool(int numFish, float sandHei) {
    fish = new Fish[numFish];
    sandHeight = sandHei;
    for (int i = 0; i < numFish; ++i) {
      fish[i] = createFish();
    }
  }

  void run() {
    ArrayList<Integer> toReplace = new ArrayList<Integer>();
    for (int i = 0; i < numFish; ++i) {
      Fish f = fish[i];
      f.display();
      f.move();
      if (f.movingRight) {
        if (f.x > width+f.fishLen) {
          toReplace.add(i);
        }
      } else {
        if (f.x < -f.fishLen) {
          toReplace.add(i);
        }
      }
    }
    for (Integer i : toReplace) {
      fish[i] = createFish();
    }
  }

  Fish createFish() {
    float offset = random(width/10.0, 2*width);
    float fx = -offset;
    if (random(1) < 0.5) {
      fx = width+offset;
    }
    return new Fish(fx, random(height-sandHeight));
  }
}