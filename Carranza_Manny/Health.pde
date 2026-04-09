class Health {
  int hits = 0;
  
  void takeDamage(int d) {
    hits += d;
    hits = constrain(hits, 0, 50);
  }
  
  void display(float x, float y) {
    for (int i = 0; i < 10; i++) {
      if (i < 10 - hits/5) fill(0, 255, 0);
      else fill(100);
      
      rect(x + i*18, y, 15, 20);
    }
  }
}
// Each Player has 10 hit points in their bar, if hit so many times, they will lose all
// their hit points and die
