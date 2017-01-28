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
  
  
   for (Player p: players) {
    p.display();
   }
   
   for (Obstacle b: obstacles) {
    b.display();
   }
  
  Boundary b1 = new Boundary(width/2, groundlevel, width, 100);
  b1.display();
}

void mousePressed() {
  Obstacle cs = new Obstacle(mouseX,mouseY);
  obstacles.add(cs);
}