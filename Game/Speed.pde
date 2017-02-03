class Speed extends Modifier
{
  
  Speed()
  {
    audio = minim.loadFile("speed2.wav");
  }
  
  void modify()
  {
    audio.play();
    audio.rewind();
    
    for (Obstacle o : obstacles)
    {
      o.display();
      o.faster();
    }
  }
}