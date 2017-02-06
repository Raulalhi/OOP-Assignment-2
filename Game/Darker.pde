
class Darker extends Modifier
{
  
  Darker()
  {
    audio = minim.loadFile("darker.wav");
  }
  
  void sound()
  {
    audio.play();
    //audio.rewind();
  }
  void modify()
  {
    
    if(timer > timetolive)
    {
      die();
    }
    
    noStroke();
    fill(0,0,0);
    rect(width/2,height/2,width, height);
    
    timer += timeDelta;
  }
  
  void die()
  {
    modifiers.remove(this);
  }
}