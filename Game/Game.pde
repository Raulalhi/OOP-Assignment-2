
 
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.dynamics.contacts.Contact;

Box2DProcessing box2d;
ArrayList<Obstacle> obstacles;

float startTime, currTime;
float spawnTime;

Boundary b1;
Boundary b2;
Player p1;

void setup()
{
  size(1000,500);
  smooth();
 
  box2d = new Box2DProcessing(this); 
  box2d.createWorld();
  box2d.listenForCollisions();
  
  obstacles = new ArrayList<Obstacle>();
  
  spawnTime = 1500;
  startTime = millis();
  
  p1 = new Player();
  b1 = new Boundary(width/2, height - 50, 400+width, 100);
  b2 = new Boundary(width/2, 50, 400+width, 100);
}

void draw()
{
  background(255);
  box2d.step();
  box2d.setGravity(0, -20);
  
  gamemode2();
  
}

void gamemode1()
{
}

void gamemode2()
{
  
  b1.display();
  b2.display();
  
  p1.display();
  
  createObstacles();
   
   for (int i = obstacles.size()-1; i>= 0; i--)
   {
     Obstacle o = obstacles.get(i);
     o.display();
     
     if(o.done())
     {
       obstacles.remove(i);
     }
   }
   
   fill(0);
   text(obstacles.size(), width/2, 200);
   text(frameRate, width/2, 190);
}

void createObstacles()
{
  currTime = millis() - startTime;
  
  if (currTime >= spawnTime)
  {
    if(random(1) > 0.5)
    {
      startTime = millis();
      obstacles.add(new Obstacle(width +90, height -100, 1));
    }
    else
    {
      startTime = millis();
      obstacles.add(new Obstacle(width + 90, 100, 2));
    }
  }
}
    
void keyPressed()
{
  p1.jump();
}