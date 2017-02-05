
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
    audio.play();
    audio.rewind();
        
    for (Obstacle o : obstacles)
    {
      o.faster();
    }
    timer += timeDelta;
  }
}