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
  //box2d.setGravity(0, -10);
}
void draw()
{
  
  background(255);
  Boundary b1 = new Boundary(width/2, height-50, width, 100);
  Player p1 = new Player(width/2, 0);
  box2d.step();
  
  p1.display();
  b1.display();
}