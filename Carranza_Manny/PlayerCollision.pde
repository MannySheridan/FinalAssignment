class PlayerCollision {
  
  float w = 40;
  
  void resolve(Player a, Player b) {
    
    float leftA = a.x;
    float rightA = a.x + w;
    
    float leftB = b.x;
    float rightB = b.x + w;
    
    // Check collision
    if (rightA > leftB && leftA < rightB) {
      
      float overlap = min(rightA - leftB, rightB - leftA);
      
      // Determine who is on the left
      if (a.x < b.x) {
        // a is left, b is right
        a.x -= overlap / 2;
        b.x += overlap / 2;
        
        // Prevents crossing
        if (a.x > b.x - w) {
          a.x = b.x - w;
        }
      } 
      else {
        // b is left, a is right
        a.x += overlap / 2;
        b.x -= overlap / 2;
        
        // Prevents crossing
        if (b.x > a.x - w) {
          b.x = a.x - w;
        }
      }
    }
  }
}
