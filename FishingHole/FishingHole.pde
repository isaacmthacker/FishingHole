int numFish = 20;
FishSchool school;

void setup() {
  size(900, 600);
  school = new FishSchool(numFish);
}

void draw() {
  background(0, 0, 255);
  school.run();
}