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
      
      case 4:
      displayleadeboard();
      break;
  }
}

color col = color(random(255), random(255),random(255));


void gamemode1()
{
  float cx = width/2;
  float cy = height/2;
  
  imageMode(CENTER);
  image(bg, cx, cy);
  
    first.play();
    main.rewind();
  
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
    if(mousePressed)
    {
      mode = 4;
    }

  }
  text("LeaderBoards", cx, cy + 60);
  
  textSize(32);
  fill (255);
  if( dist(mouseX, mouseY, cx, cy + 120) < 32)
  {
    textSize(40);
    fill (col);
    if(mousePressed)
    {
      exit();
    }
  }
  text("Exit", cx, cy + 120);
    
  
}

void gamemode2()
{
  image(bg2, width/2, height/2);
  main.play();
  first.rewind();
  
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


String name="";
int name_index=0;

void gamemode3()
{
  float cx = width/2;
  float cy = height/2;
  
  for (int i = obstacles.size()-1; i>= 0; i--)
  {
    Obstacle o = obstacles.get(i);
    o.display();
    obstacles.remove(i);
    o.killBody();
  }
  
  image(bg, width/2, height/2);
  
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(cx, cy, 500, 250, 50);
  fill(255);
  textSize(40);
  text("Game Over", cx, cy -40);
  text("Enter Name:", cx, cy + 10);
  

  if(keyPressed && (name_index<12 || key==ENTER))
    {
      
      delay(200);
      if(key!=BACKSPACE && key!=ENTER)
      {
        name+=Character.toUpperCase(key);
        name_index++;
      }
      
      if(key==ENTER && name_index>0) 
      {
        Winner w1 = new Winner(name, score);
        winners.add(w1);
        PrintWriter leaderboards;
        leaderboards = createWriter(dataPath("leaderboard.tsv"));
        leaderboards.println("Name" + "\t" + "Score");
        for( Winner w: winners)
        {
          leaderboards.println(w);
        }
        leaderboards.close();
        name = "";
        score = 0;
        mode = 1;
      }
      
      if(key==BACKSPACE && name_index>0)  
      {
        delay(200);
        name_index--;
        name=name.substring(0,name.length()-1);
      }
    }
    else
    {
      if(key==BACKSPACE && name_index==12)  
      {
        delay(200);
        name_index--;
        name=name.substring(0,name.length()-1);
      }
    }
    if(keyPressed)
   {
     if(key == ENTER)
     {
       p1.killBody();
       setupgame();
       mode = 2;
     }
     else if (key == ';')
    {
       p1.killBody();
       setupgame();
       mode = 1;
    }
   }
    // Displaying the characters
    textSize(40);
    textAlign(CENTER);
    text(name, cx, cy + 60);
    
    
    if(dist(mouseX, mouseY, cx, height - 25) < 32)
    {
      textSize(40);
      fill (col);
      if(mousePressed)
      {
        mode = 1;
      }
    }
    text("MAIN MENU", cx, height - 25);
}