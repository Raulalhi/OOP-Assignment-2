Table table;
int[] scores;
ArrayList<Winner> winners;

class Winner
{
  String name;
  int score;
  
  Winner(String name, int score)
  {
    this.name = name;
    this.score = score;
  }
  
  String toString()
  {
    return name + "\t" + score;
  }
}

void leaderboards()
{
  winners = new ArrayList<Winner>();
  scores = new int[10];
  table = loadTable("leaderboard.tsv", "header");
  for( TableRow row : table.rows())
  {
    String name = row.getString("Name");
    int score = row.getInt("Score");
    
    Winner w = new Winner(name, score);
    winners.add(w);
  }
  
  int i = 0;
  for(Winner w: winners)
  {
    scores[i] = w.score;
    i++;
  }
  
}

void displayleadeboard()
{
  main.rewind();
  scores = sort(scores);
  int j = 1;
  float cx = width/2;
  float cy = height/2;
  float con = -150;
  image(bg, cx, cy);
  
  
  for(int i = 9; i >= 0; i--)
  {
    for(Winner w: winners)
    {
      if(scores[i] == w.score)
      {
        fill(255);
        textSize(32);
        text(j + ". " + w.name + " " + w.score, cx, cy + con);
        j++;
        con += 50;
      }
    }
  }
  
  if(dist(mouseX, mouseY, cx, height - 25) < 32)
  {
    textSize(40);
    fill (col);
    if(mousePressed)
    {
      mode = 1;
    }
  }
  text("BACK", cx, height - 25);
}