float timeDelta = 1.0f / 60.0f;
float timer = 0;

class Darker extends Modifier
{
  
  Darker()
  {
    audio = minim.loadFile("darker.wav");
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
    noStroke();
    fill(0,0,0);
    
    float x = 5;
    
    while(timer > x)
    {
      rect(width/2,height/2,width, height);
      timer += timeDelta;
    }
    timer = 0;
  }
}