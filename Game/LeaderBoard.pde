Table table;
int[] scores = new int[10];
ArrayList<Winner> winners = new ArrayList<Winner>();

class Winner
{
  String name;
  int score;
  
  Winner(TableRow row)
  {
    this.name = row.getString("Name");
    this.score = row.getInt("Score");
  }
  
  String toString()
  {
    return name + " " + score;
  }
}

void leaderboards()
{
  table = loadTable("leaderboard.tsv", "header");
  
  
  for( TableRow row : table.rows())
  {    
    Winner w = new Winner(row);
    winners.add(w);
  }
  
  for(Winner w: winners)
  {
    println(w);
  }
  
}