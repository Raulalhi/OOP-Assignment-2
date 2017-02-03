import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.dynamics.contacts.Contact;
import ddf.minim.*;

Box2DProcessing box2d;
Minim minim;

ArrayList<Obstacle> obstacles;

float startTime, currTime;
float spawnTime;

PImage bg;
PFont font;

int score;

Boundary b1;
Boundary b2;
Player p1;

Speed s1;
Darker d1;

void setup()
{
  size(1000,500);
  smooth();
 
  box2d = new Box2DProcessing(this); 
  box2d.createWorld();
  box2d.listenForCollisions();
  
  minim = new Minim(this);
  
  obstacles = new ArrayList<Obstacle>();
  
  spawnTime = 1000;
  startTime = millis();
  
  bg = loadImage("wallpaper3.png");
  font = createFont("Pixel LCD-7.ttf", 32);
  textFont(font);
  
  bg.width = 1000;
  bg.height = 500;
  
  s1 = new Speed();
  d1 = new Darker();
  setupgame();
}

void setupgame()
{
  p1 = null;
  b1 = null;
  b2 = null;
  
  p1 = new Player();
  b1 = new Boundary(width/2, height - 50, 400+width, 100);
  b2 = new Boundary(width/2, 50, 400+width, 100);
}

void draw()
{
  background(bg);
  box2d.step();
  box2d.setGravity(0, -30);
  
  gamemode();
  
}

int  mode = 2;
void gamemode()
{
  switch (mode)
  {
    case 1:
      break;
    case 2:
      
      gamemode2();
      break;
      
    case 3:
      gamemode3();
      break;
  }
}

void gamemode2()
{
  b1.display();
  b2.display();
    
  p1.display();
  
  createObstacles();
  
  score = frameCount / 2;
   
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
    fill(255);
    textSize(16);
    text("SCORE:" + score, 20, 50);
}

void gamemode3()
{
  background(0);
  score = 0;
   
  for (int i = obstacles.size()-1; i>= 0; i--)
  {
    Obstacle o = obstacles.get(i);
    o.display();
    obstacles.remove(i);
    o.killBody();
  }
  if(keyPressed)
  {
    if(key == 'y')
    {
      p1.killBody();
      setupgame();
      mode = 2;
    }
    else if (key =='n')
    {
    }
  }
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
      s1.modify();
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
  if(key == 'w')
  {
    p1.jump();
  }
  if(key == 's')
  {
    p1.down();
  }
}