class CombatSystem {
  void handleHit(Player a, Player b) {
    if (a.combat.attacking && a.combat.attackTimer > 0) { //If Player A started attacking, it will still be active within the time window
      
      float dist = abs(a.pos.x - b.pos.x); //Checks the distance between the 2 players
      
       if (dist < 50 && b.hitCooldown.canHit()) { //VERY IMPORTANT: checks if the hit is valid, dist < 50 means the players are within the attack range
      
        
        if (!b.block.blocking) { //IF you are NOT blocking, damage and knockback are applied, but if you are blocking, then nothing is applied
          b.health.takeDamage(a.combat.damage); //Reduces health based on attack strength
          
          float dir = (b.pos.x > a.pos.x) ? 1 : -1;
           b.knockback.apply(dir, a.combat.damage * 3); //Applies knockback depending on the damage type
        }
        
         b.hitCooldown.trigger(); //This prevents repeated hits every frame
      }
    }
  }
} 
