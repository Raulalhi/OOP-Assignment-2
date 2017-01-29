
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
ArrayList<Obstacle> obstacles;

void setup()
{
  size(1000,500);
  smooth();
 
  
  box2d = new Box2DProcessing(this); 
  box2d.createWorld();
  
  players = new ArrayList<Player>();
  obstacles = new ArrayList<Obstacle>();
  
  Player p = new Player();
  players.add(p);
}

void draw()
{
  background(255);
  box2d.step();
  float groundlevel = height - 50;
  box2d.setGravity(0, -20);
  
  createObstacles();
  
   for (Player p: players) {
    p.display();
   }
   
   for (int i = obstacles.size()-1; i>= 0; i--)
   {
     Obstacle o = obstacles.get(i);
     o.display();
     
     if(o.done())
     {
       obstacles.remove(i);
     }
   }
   
   text(obstacles.size(), width/2, 200);
  
  Boundary b1 = new Boundary(width/2, groundlevel, width, 100);
  Boundary b2 = new Boundary(width/2, 50, width, 100);
  b1.display();
  b2.display();
}


float time = millis();
void createObstacles()
{
  if (millis() > time + 2000)
  {
    Obstacle cs = new Obstacle();
    obstacles.add(cs);
    time = millis();
  }
}

void keyPressed()
{
  for (Player p: players) {
    p.jump();
   }
}