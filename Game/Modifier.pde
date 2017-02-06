abstract class Modifier
{
  AudioPlayer audio;
  int timetolive = 5;
  int time = 0;
  
  Modifier()
  {
  }
  
  
  abstract void modify();
}