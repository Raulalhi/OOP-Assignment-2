class Darker extends Modifier
{
  
  Darker()
  {
    audio = minim.loadFile("darker.wav");
  }
  
  void modify()
  {
    noStroke();
    fill(0,0,0, 20);
    rect(width/2,height/2,width, height);
  }
}