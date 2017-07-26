int numFish = 50;
FishSchool school;
int numSeaWeed = 20;
ArrayList<SeaWeed> seaweed = new ArrayList<SeaWeed>();
float sandHeight;

ArrayList<Bubbles> bubbles = new ArrayList<Bubbles>();


void setup() {
  size(1300, 700);
  sandHeight = height/10.0;
  school = new FishSchool(numFish, sandHeight);
  for (int i = 0; i < numSeaWeed; ++i) {
    seaweed.add(new SeaWeed(random(width), random(height-sandHeight, height)));
  }
}

void draw() {
  drawScenery();
  school.run();
  if (random(1) < 0.001 && bubbles.size() < 3) {
    bubbles.add(new Bubbles());
  }
  if (!bubbles.isEmpty()) {
    for (int i = 0; i < bubbles.size(); ++i) {
      Bubbles b = bubbles.get(i);
      b.move();
      b.display();
      if (b.cy < -b.bubRectH) {
        bubbles.remove(i);
      }
    }
  }
}


void drawScenery() {
  background(0, 0, 255);
  fill(color(194, 178, 128));
  rect(0, height-sandHeight, width, height-sandHeight);
  for (SeaWeed s : seaweed) {
    s.display();
  }
}