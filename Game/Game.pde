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

AudioPlayer main;

ArrayList<Obstacle> obstacles;

float startTime, currTime, startTime2, currTime2;
float spawnTime, spawnTime2;

PImage bg;
PImage bg2;

PFont font;

int score;

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

  minim = new Minim(this);
  main = minim.loadFile("main.wav");
  
  obstacles = new ArrayList<Obstacle>();

  spawnTime = 1000;
  spawnTime2 = 5000;
  startTime = millis();
  startTime2 = millis();

  bg = loadImage("wallpaper.png");
  bg2 = loadImage("wallpaper3.png");
  font = createFont("Pixel LCD-7.ttf", 32);
  textAlign(CENTER);
  textFont(font);
  
  setupgame();
  leaderboards();
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
  background(255);
  
  box2d.step();
  box2d.setGravity(0, -30);

  gamemode();

}

void createObstacles()
{
  currTime = millis() - startTime;

  if (currTime >= spawnTime)
  {
    if(random(1) > 0.5)
    {
      startTime = millis();
      obstacles.add(new Obstacle(width +100, height -100, 1));
    }
    else
    {
      startTime = millis();
      obstacles.add(new Obstacle(width + 100, 100, 2));
    }
  }
}

float timeDelta = 1.0f / 60.0f;
float timer = 0;
float spawn = 10;
boolean timeset = true;
ArrayList<Modifier> modifiers = new ArrayList<Modifier>();

void applyModifiers()
{

  if (timer > spawn)
  {
    int mod = (int)random(1,3);
    Modifier m;
    
    if( mod == 1)
    {
      m = new Speed();
    }
    else
    {
      m = new Darker();
    }
    
    modifiers.add(m);
    timer = 0;
  }
  
  for (int i = modifiers.size()-1; i>= 0; i--)
  {
    Modifier p = modifiers.get(i);
    
    if(p instanceof Speed)
    {
      Speed s = (Speed) p;
      s.modify();
    }
    else if(p instanceof Darker)
    {
      Darker d = (Darker) p;
      d.modify();
    }
    
  }
  
  timer += timeDelta;
  
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