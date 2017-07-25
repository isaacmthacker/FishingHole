class FishSchool {
  ArrayList<Fish> fish;

  FishSchool(int numFish) {
    fish = new ArrayList<Fish>();
    for (int i = 0; i < numFish; ++i) {
      float fx = 0;
      if (random(1) < 0.5) {
        fx = width;
      }
      fish.add(new Fish(fx, random(height)));
    }
  }

  void run() {
    for (int i = 0; i < fish.size(); ++i) {
      Fish f = fish.get(i);
      f.display();
      f.move();
      if (f.movingRight) {
        if (f.x > width+f.fishLen) {
          fish.remove(i);
        }
      } else {
        if (f.x < -f.fishLen) {
          fish.remove(i);
        }
      }
    }
  }
}