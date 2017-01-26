import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

void setup()
{
  size(1000,500);
  background(255);
}

Player p1 = new Player();

void draw()
{
  fill(0);
  rect(0, height - 50, width, 50);
  p1.display(width/2, height/2);
}