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
      
      if (keys['s'] && keys['t']) attack(2); // crouch attack (original idea but kept it in since it didn't break the code if anything changed
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
    attackTimer = 10; //when attacking, the attack lasts 10 frames 
    
    if (type == 1) { damage = 1; attackTimer = 8; }
    if (type == 2) { damage = 2; attackTimer = 12; }
    if (type == 3) { damage = 3; attackTimer = 18; }//Represents the damage types [1 = Light, 2 = Medium, 3 = Heavy]
  }
}
