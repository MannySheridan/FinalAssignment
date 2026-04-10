class Knockback {
  Player p;
  
  float forceX = 0;
  
  Knockback(Player p) {
    this.p = p; //Links the knockback to whatevery player is being hit
  }
  
  void apply(float dir, float strength) {
    forceX = dir * strength; //Applies the knockback, using the direction and how strong the hit is
  }
  
  void update() {
    p.pos.x += forceX; //Moves the player based on the knockback force
    forceX *= 0.8; //Reduces the force of the knockback each frame
    
    if (abs(forceX) < 0.1) forceX = 0; // Prevents sliding
    
    p.pos.x = constrain(p.pos.x, 0, width - 40); // Keeps the player inside the screen
  }
}
