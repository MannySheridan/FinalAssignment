class PlayerCollision {
  
  float w = 40; //Assumes the players are 40 pixels wide
  
  void resolve(Player a, Player b) {
    
    float leftA = a.pos.x;
    float rightA = a.pos.x + w;
    
    float leftB = b.pos.x;
    float rightB = b.pos.x + w;
    
    // Check collision
    if (rightA > leftB && leftA < rightB) { //Checks if Player A's right side passed Player B's left and Player A's left side is before Player B's right
      
      float overlap = min(rightA - leftB, rightB - leftA); // Finds out how much the players are 'inside' each other
      
      // See who is on the left
      if (a.pos.x < b.pos.x) {
        // a is left, b is right
        a.pos.x -= overlap / 2;
        b.pos.x += overlap / 2;
        
        // Prevents crossing
        if (a.pos.x > b.pos.x - w) {
          a.pos.x = b.pos.x - w;
        }
      } 
      else {
        // b is left, a is right
        a.pos.x += overlap / 2;
        b.pos.x -= overlap / 2;
        
        // Prevents crossing
        if (b.pos.x > a.pos.x - w) {
          b.pos.x = a.pos.x - w;
        }
      }
    }
  }
}
