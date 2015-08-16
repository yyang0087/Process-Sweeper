public class Clue {
  public Clue(int x, int y, Boolean[][] bool, int dim, Boolean[][] hasBeenCalled) {
    xcord = x;
    ycord = y;
    cluesDisplayed=0;
    locOfBombs = bool;
    beenCalled = hasBeenCalled;
  }
  public int countNeighbors(int x,int y) {
    int index = 0;
    boolean inBounds = (index>=0 && (index<locOfBombs.length));
    //println("counting");
    int clue = 0;
     if(true) {
       for(int i=(x-1); i<=(x+1); i++) {
          for(int j=(y-1); j<=(y+1); j++) {
            inBounds = (i>=0 && j>=0 && i<locOfBombs.length && j<locOfBombs.length);
            if(inBounds) {
              //println("checkingbombs "+i+" "+j);
              if(locOfBombs[i][j]) {
                //println("adding clue "+i+" "+j);
                clue++;
              }
            }
          }
        }
     }
     return clue;
  }
  public void determineClue(int x, int y) {
    int clue = 0;
    clue = countNeighbors(x,y);
    xcord = x;
    ycord = y;
    display(clue);
    Boolean inBounds = ((x-1)>=0 && (y-1)>=0 && (x+1)<locOfBombs.length && (y+1)<locOfBombs.length);
    println(inBounds);
    if(clue == 0 && inBounds) {
      if(!beenCalled[x-1][y-1]){
        beenCalled[x-1][y-1] = true;
        determineClue(x-1, y-1);
      }
      if(!beenCalled[x][y-1]){
        beenCalled[x][y-1] = true;
        determineClue(x, y-1);
      }
      if(!beenCalled[x+1][y-1]){
        beenCalled[x+1][y-1] = true;
        determineClue(x+1, y-1);
      }
      if(!beenCalled[x-1][y]){
        beenCalled[x-1][y] = true;
        determineClue(x-1, y);
      }
      if(!beenCalled[x+1][y]){
        beenCalled[x+1][y] = true;
        determineClue(x+1, y);
      }
      if(!beenCalled[x-1][y+1]){
        beenCalled[x-1][y+1] = true;
        determineClue(x-1, y+1);
      }
      if(!beenCalled[x][y+1]){
        beenCalled[x][y+1] = true;
        determineClue(x, y+1);
      }
      if(!beenCalled[x+1][y+1]){
        beenCalled[x+1][y+1] = true;
        determineClue(x+1, y+1);
      }
    }
  }
  void display(int clue) {
   fill(color(0));
   textSize(30);
   if(true/**clue != 0*/){
      text(clue, xcord*50+10+11, ycord*50+10+30);
   }
   println("xcord: "+xcord+"ycord: "+ycord);
   cluesDisplayed++;
  }
  public int getDisplayed(){
    return cluesDisplayed;
  }
  private int cluesDisplayed;
  private Boolean[][] beenCalled;
  private int xcord;
  private int ycord;
  private Boolean[][] locOfBombs;
}
