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

float startTime, currTime, startTime2, currTime2;
float spawnTime, spawnTime2;

PImage bg;
PImage bg2;
PImage tex;

float textureCoordX[] = {500, 0, 500};
float textureCoordY[] = {0, 300, 300};
PFont font;

int score;

Boundary b1;
Boundary b2;
Player p1;


Speed s1;
Darker d1;

void setup()
{
  size(1000,500, P2D);
  smooth();
  
  float cx = width/2;
  float cy = height/2;

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();

  minim = new Minim(this);

  obstacles = new ArrayList<Obstacle>();

  spawnTime = 1000;
  spawnTime2 = 7000;
  startTime = millis();
  startTime2 = millis();

  bg = loadImage("wallpaper.png");
  bg2 = loadImage("wallpaper3.png");
  tex = loadImage("texture2.jpg");
  font = createFont("Pixel LCD-7.ttf", 32);
  textAlign(CENTER);
  textFont(font);
  
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
      obstacles.add(new Obstacle(width +90, height -100, 1));
    }
    else
    {
      startTime = millis();
      obstacles.add(new Obstacle(width + 90, 100, 2));
    }
  }
}

//void applyModifiers()
//{
//  currTime2 = millis() - startTime2;

//  if (currTime2 >= spawnTime)
//  {
//    int mc = (int) random(1,3);
//    switch (mc)
//    {
//      case 1:
//      //d1.sound();
//      float x = 2;
  
//      if(timer > x)
//      {
//        d1.modify();
//        println("after x seconds");
//      }
//      else
//      {
//        timer += timeDelta;
//      }
//      break;

//      case 2:
//      d1.modify();
//      break;
//    }
//  }
//}

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