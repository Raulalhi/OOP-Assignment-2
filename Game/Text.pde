class Text
{
  String content;
  float x;
  float y;
  
  Text(String content, float x, float y)
  {
    this.content = content;
    this.x = x;
    this.y = y;
  }
  
  void display()
  {
    fill(255);
    textSize(32);
    text(content, x, y);
  }
  
  void change(color col)
  {
    fill(col);
    textSize(40);
  }
}