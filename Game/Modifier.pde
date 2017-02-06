abstract class Modifier
{
  AudioPlayer audio;
  int timetolive = 5;
  
  Modifier()
  {
  }
  abstract void sound();
  abstract void modify();
}