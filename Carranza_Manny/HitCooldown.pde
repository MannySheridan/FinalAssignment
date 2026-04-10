class HitCooldown {
  int timer = 0; 
  int max = 20;
  
  void update() {
    if (timer > 0) timer--; // Decreases the time and moves it closer to 0
  }
  
  boolean canHit() {
    return timer == 0; //If True, player can be hit, else the player is still in cooldown
  }
  
  void trigger() {
    timer = max; // Resets the timer back up to 20 with the player not beinghit until it counts down
  }
}
