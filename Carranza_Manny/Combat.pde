class Combat {
  Player p;
  boolean attacking = false;
  int attackTimer = 0;
  int damage = 1;
  
  Combat(Player p) {
    this.p = p;
  }
  
  void update() {
    attacking = false;
    // Combat keybinds for Player 1
    if (p.isP1) {
      if (keys['r']) attack(1);
      if (keys['t']) attack(2);
      if (keys['y']) attack(3);
      
      if (keys['s'] && keys['t']) attack(2); // crouch attack
    } 
    else {
      // Combat keybinds for Player 2
      if (keys['o']) attack(1);
      if (keys['p']) attack(2);
      if (keys['[']) attack(3);
    }
    
    if (attackTimer > 0) attackTimer--;
  }
  
  void attack(int type) {
    attacking = true;
    attackTimer = 10;
    
    if (type == 1) damage = 1;
    if (type == 2) damage = 2;
    if (type == 3) damage = 3;
  }
}
