class Movement {
  Player p;
  float speed = 4;
  float yVel = 0;
  boolean onGround = true;
  
  Movement(Player p) {
    this.p = p;
  }
  
  void update() {
    // PLAYER 1
    //Movement keybinds for Player 1
    if (p.isP1) {
      if (keys['a']) p.x -= speed;
      if (keys['d']) p.x += speed;
      
      if (keys['w'] && onGround) {
        yVel = -10;
        onGround = false;
      }
      
      if (keys['s']) p.y += 2;
    }
    // PLAYER 2
    // Movement keybinds for Player 2
    else {
      if (keyPressed && keyCode == LEFT) p.x -= speed;
      if (keyPressed && keyCode == RIGHT) p.x += speed;
      
      if (keyPressed && keyCode == UP && onGround) {
        yVel = -10;
        onGround = false;
      }
      
      if (keyPressed && keyCode == DOWN) p.y += 2;
    }
    
    // Gravity
    p.y += yVel;
    yVel += 0.5;
    
    if (p.y >= height-100) {
      p.y = height-100;
      yVel = 0;
      onGround = true;
    }
    // Screen collision
    p.x = clamp(p.x, 0, width - 40);
  }
}
