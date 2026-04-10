class Block {
  Player p;
  boolean blocking = false;
  
  Block(Player p) {
    this.p = p;
  }
  
  void update() {
    blocking = false;
    //Blocking commands
    if (p.isP1) {
      if (keys['f']) blocking = true;
    } else {
      if (keys['l']) blocking = true; 
    } //Depending on the side of the player 'F' and 'L' are to block
  }
}
