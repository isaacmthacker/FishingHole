class BubbleMaker {
  ArrayList<Bubbles> bubbles;
  BubbleMaker() {
    bubbles = new ArrayList<Bubbles>();
  }
  void run() {
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
}