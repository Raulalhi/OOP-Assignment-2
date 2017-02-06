
class Darker extends Modifier
{
  
  Darker()
  {
    audio = minim.loadFile("darker.wav");
  }
  
  void modify()
  {
    
    audio.play();
    noStroke();
    fill(0,0,0,70);
    rect(width/2,height/2,width, height);
    
    timer += timeDelta;
    
    if(timer > timetolive)
    {
      die();
    }
  }
  
  void die()
  {
    modifiers.remove(this);
  }
}