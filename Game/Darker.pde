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
    noStroke();
    fill(0,0,0);
    rect(width/2,height/2,width, height);
  }
}