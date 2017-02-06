
class Speed extends Modifier
{
  
  Speed()
  {
    audio = minim.loadFile("speed2.wav");
  }
  
  void sound()
  {
    audio.play();
    audio.rewind();
  }
  
  
  void modify()
  {
    if(timer > timetolive)
    {
      die();
    }
    
    
    for (Obstacle o : obstacles)
    {
      o.faster();
    }
    timer += timeDelta;
  }
  
  void die()
  {
    modifiers.remove(this);
  }
}