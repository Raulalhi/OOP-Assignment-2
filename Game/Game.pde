import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;

void setup()
{
  size(1000,500);
  smooth();
  background(255);
  
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();
  box2d.setGravity(0, -10);
  
}
Player p1 = new Player(0, 0);
void draw()
{
  background(255);
  box2d.step();
  
  Boundary b1 = new Boundary(width/2, height-50, width, 100);
  b1.display();
}