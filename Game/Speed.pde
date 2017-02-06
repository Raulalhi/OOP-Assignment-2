
class Speed extends Modifier
{
  
  Speed()
  {
    audio = minim.loadFile("speed2.wav");
  }
  
  
  void modify()
  {
    audio.play();
    
    timeset = false;
    for (Obstacle o : obstacles)
    {
      o.faster();
    }
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