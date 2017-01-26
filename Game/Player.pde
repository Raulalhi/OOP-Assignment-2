class Player{
  
  float playersize;
  
  Player()
  {
    playersize = 100;
  }
  
  void display(float midX, float midY)
  { 
    //Arms
    fill(#F58FC2);
    ellipse(midX-40,midY,40,30);
    ellipse(midX+40,midY,40,30);
    
    //Feet
    fill(#9B1E1E);
    arc(midX-20, midY+40, 40, 30, 0, PI/.5, CHORD);//kirbys feet  
    arc(midX+20, midY+40, 40, 30, 0, PI/.5, CHORD);
    
    //Body
    stroke(0);
    fill(#F58FC2);
    ellipse(midX, midY, playersize, playersize);
    
    fill(0);
    ellipse(midX-10, midY-15, 10, 30);//kirbys eye sockets
    ellipse(midX+10, midY-15, 10, 30);
 
    fill(255);
    ellipse(midX-10, midY-22, 10, 15);//kirbys pupils
    ellipse(midX+10, midY-22, 10, 15);
 
    fill(#483989);
    ellipse(midX-10, midY-6, 9, 12);//eye shadow
    ellipse(midX+10, midY-6, 9, 12);
 
    fill(0);
    ellipse(midX-11, midY-10, 6, 6);//eye shadow hard to draw cleanly..
    ellipse(midX+9, midY-10, 6, 6);
 
    noStroke();
    fill(#FF4B4B);
    ellipse(midX-22, midY, 15, 8);  // blush cheeks
    ellipse(midX+22, midY, 15, 8);
 
    stroke(0);
    fill(#C42222);
    arc(midX, midY+8, 20, 20, 0, PI, CHORD); //kirbys mouth
  }
}