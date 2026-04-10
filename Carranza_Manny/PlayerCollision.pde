class PlayerCollision {
  
  float w = 40;
  
  void resolve(Player a, Player b) {
    
    float leftA = a.pos.x;
    float rightA = a.pos.x + w;
    
    float leftB = b.pos.x;
    float rightB = b.pos.x + w;
    
    // Check collision
    if (rightA > leftB && leftA < rightB) {
      
      float overlap = min(rightA - leftB, rightB - leftA);
      
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
