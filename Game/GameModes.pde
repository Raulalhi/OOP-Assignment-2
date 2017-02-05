int  mode = 1;

void gamemode()
{
  switch (mode)
  {
    case 1:
    gamemode1();
      break;
    case 2:

      gamemode2();
      break;

    case 3:
      gamemode3();
      break;
  }
}

void gamemode1()
{
  float cx = width/2;
  float cy = height/2;
  color col;
  background(0);
  
  if(frameCount % 60 == 0)
  {
    col = (random(0, 255), random(0, 255), random(0, 255));
  }
  textSize(64);
  text("Game Name", cx, cy -150);
  
  fill(255);
  textSize(32);
  text("Play", cx, cy);
  text("LeaderBoards", cx, cy +50);
  text("Exit", cx, cy +100);
}
void gamemode2()
{
  b1.display();
  b2.display();

  p1.display();

  createObstacles();
  //applyModifiers();

  score += 1;

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
  float cx = width/2;
  float cy = height/2;
  
  background(0);
  score = 0;
  
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(cx, cy, 500, 250, 50);
  fill(255);
  textSize(32);
  text("Game Over", cx, cy -70);
  text("Play again?", cx, cy -20);
  text("(Y/N)", cx, cy + 30);
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
      exit();
    }
  }
}