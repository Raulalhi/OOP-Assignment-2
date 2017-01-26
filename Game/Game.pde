import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


Box2DProcessing box2d;


void setup()
{
  size(1000,500);
  background(255);
  
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();
  
  
  
}

Player p1 = new Player();
Ground floor = new Ground(width/2, height-25);

void draw()
{
  box2d.step();
  p1.display(width/2, height/2);
  floor.display();
}