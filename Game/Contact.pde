

void beginContact(Contact cp)
{
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  
  if (o1.getClass() == Player.class && o2.getClass() == Obstacle.class)
  {
    
    mode = 3;
  } 
  else if (o2.getClass() == Player.class && o1.getClass() == Obstacle.class)
  {
    mode = 3;
  }
}


void endContact(Contact cp) {
}