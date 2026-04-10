class CombatSystem {
  //Combat system that senses when attacking the other player, a hidden combat timer will be triggered
  // and in that timer, the other player will take damage
  void handleHit(Player a, Player b) {
    if (a.combat.attacking && a.combat.attackTimer > 0) {
      
      float dist = abs(a.x - b.x);
      
       if (dist < 50 && b.hitCooldown.canHit()) {
      
        
        if (!b.block.blocking) {
          b.health.takeDamage(a.combat.damage);
          
          float dir = (b.x > a.x) ? 1 : -1;
           b.knockback.apply(dir, a.combat.damage * 3);
        }
        
         b.hitCooldown.trigger();
      }
    }
  }
} 
