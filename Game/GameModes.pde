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

color col = 255;


void gamemode1()
{
  float cx = width/2;
  float cy = height/2;
  
  imageMode(CENTER);
  image(bg, width/2, height/2);

  
  if(frameCount % 30 == 0)
  {
    col = color(random(255), random(255), random(255));
  }
  textSize(64);
  fill(col);
  text("Game Name", cx, cy -150);
  
  
  textSize(32);
  fill (255);
  
  if( dist(mouseX, mouseY, cx, cy) < 32) 
  {
    textSize(40);
    fill (col);
    if(mousePressed)
    {
      mode = 2;
    }
  }
  text("Play", cx, cy);
  
  textSize(32);
  fill (255);
  if( dist(mouseX, mouseY, cx, cy + 60) < 32)
  {
    textSize(40);
    fill (col);

  }
  text("LeaderBoards", cx, cy + 60);
  
  textSize(32);
  fill (255);
  if( dist(mouseX, mouseY, cx, cy + 120) < 32)
  {
    textSize(40);
    fill (col);
  }
  text("Exit", cx, cy + 120);
    
  
}


void gamemode2()
{
  image(bg2, width/2, height/2);
  b1.display();
  b2.display();

  p1.display();

  createObstacles();
  applyModifiers();

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

    fill(255);
    textSize(18);
    text("SCORE:" + score, 70, 50);
}

void gamemode3()
{
  float cx = width/2;
  float cy = height/2;
  
  image(bg, width/2, height/2);
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
      p1.killBody();
      setupgame();
      mode = 1;
    }
  }
}