import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
ArrayList<Player> players;

void setup()
{
  size(1000,500);
  smooth();
 
  
  box2d = new Box2DProcessing(this); 
  box2d.createWorld();
  
  players = new ArrayList<Player>();
  Player p = new Player(250,0);
  players.add(p);
}

void draw()
{
  background(255);
  box2d.step();
  float groundlevel = height - 50;
  
  
   for (Player b: players) {
    b.display();
  }
  
  Boundary b1 = new Boundary(width/2, groundlevel, width, 100);
  b1.display();
}