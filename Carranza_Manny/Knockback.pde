class Knockback {
  Player p;
  
  float forceX = 0;
  
  Knockback(Player p) {
    this.p = p;
  }
  
  void apply(float dir, float strength) {
    forceX = dir * strength;
  }
  
  void update() {
    p.x += forceX;
    forceX *= 0.8;
    
    if (abs(forceX) < 0.1) forceX = 0;
    
    p.x = constrain(p.x, 0, width - 40);
  }
}
// WHen attcking, the other player will be knocked back a certain distance depending on the sort of attack (e.g., Lght attack = barely any movement, Heavy attack = a lot of pushback)
