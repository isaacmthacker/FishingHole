int numFish = 35;
FishSchool school;
int numSeaWeed = 20;
ArrayList<SeaWeed> seaweed = new ArrayList<SeaWeed>();
float sandHeight;

BubbleMaker bubbleMaker = new BubbleMaker();
//ArrayList<Bubbles> bubbles = new ArrayList<Bubbles>();

int numSpecs = int(random(50, 100));
float[][] sandSpecs;

StarFish starFish;

FishingLure lure;


Point[] pnts = {new Point(100, 100), new Point(200, 200), new Point(300, 300), new Point(400, 400)};

void setup() {
  size(1300, 700);
  sandHeight = height/10.0;
  lure = new FishingLure();

  school = new FishSchool(numFish, sandHeight);
  for (int i = 0; i < numSeaWeed; ++i) {
    seaweed.add(new SeaWeed(random(width), random(height-sandHeight, height)));
  }
  sandSpecs = new float[numSpecs][2];
  for (int i = 0; i < numSpecs; ++i) {
    sandSpecs[i][0] = random(width);
    sandSpecs[i][1] = random(height-sandHeight, height);
  }
  starFish = new StarFish();
}

void draw() {
  drawScenery();
  school.run(lure);
  bubbleMaker.run();
  lure.run();
}


void mousePressed() {
  lure.clicked();
}



void drawScenery() {
  background(0, 0, 255);
  fill(color(194, 178, 128));
  rect(0, height-sandHeight, width, height-sandHeight);
  fill(0);
  for (int i = 0; i < numSpecs; ++i) {
    rect(sandSpecs[i][0], sandSpecs[i][1], 1, 1);
  }
  starFish.display();
  for (SeaWeed s : seaweed) {
    s.display();
  }
}