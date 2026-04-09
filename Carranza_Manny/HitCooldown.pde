class HitCooldown {
  int timer = 0;
  int max = 20;
  
  void update() {
    if (timer > 0) timer--;
  }
  
  boolean canHit() {
    return timer == 0;
  }
  
  void trigger() {
    timer = max;
  }
}
