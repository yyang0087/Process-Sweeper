int dim = 6;
int perc = 13;
Boolean gameOver = false;
Boolean nope = true;
int col = dim;
int row = dim;
int totalBombs = 0;
int totalUncovered = 0;
Square[][] squares = new Square[col][row];
Clue[][] clues = new Clue[col][row];
Bomb[][] bombs = new Bomb[col][row];
Boolean[][] isBomb = new Boolean[col][row];
Boolean[][] hasBeenCalled = new Boolean[col][row];
PImage[][] flags = new PImage[col][row];
Boolean[][] isAFlag = new Boolean[col][row];
void initSquares() {
  for(int i = 0; i<col; i++) {
    for(int j = 0; j<row; j++) {
       squares[i][j] = new Square(i*50+10,j*50+10);
    }
  }     
}
void initBombs() {
  for(int i = 0; i<col; i++) {
   for(int j = 0; j<row; j++) {
     float r = random(perc);
     if( ( (int) r)==0) {
       bombs[i][j] = new Bomb(i*50+10,j*50+10);
       isBomb[i][j] = true;
       totalBombs++;
     }
     else{
       isBomb[i][j] = false;
     }
   }
  }
}
void initClues() {
  for(int i = 0; i<col; i++) {
    for(int j = 0; j<row; j++) {
       clues[i][j] = new Clue(i,j, isBomb, dim, hasBeenCalled);
       isAFlag[i][j] = false;
    }
  }     
}
void setup() {
 size(dim*51,dim*60); 
 line(0, 0, width, height);
 background(100,255,100);
 initSquares();
 initBombs();
 initClues();
 for(int i=0; i<dim; i++) {
      for(int j=0; j<dim; j++) {
        hasBeenCalled[i][j] = false;
      }
  }
 
}
int value = 0;
void draw() {
  if(mousePressed && (mouseButton == LEFT && nope)) {
     for(int i = 0; i<col; i++) {
       for(int j = 0; j<row; j++) {
           if(mouseX >i*50+10 && mouseX<i*50+10+40 && mouseY>j*50+10 && mouseY<j*50+10+40) {
              if(isBomb[i][j]) {
                gameOver = true;
              }
              else{
                squares[i][j]= new Square(i*50+10,j*50+10, 255);
                clues[i][j].determineClue(i,j);
                totalUncovered+=clues[i][j].getDisplayed();
                println("totaluncovered: "+totalUncovered+" "+dim*dim);
                nope = false;
              }
            }
       }
     }
  }
  
  if(mousePressed && (mouseButton == RIGHT) && nope) {
    for(int i = 0; i<col; i++) {
       for(int j = 0; j<row; j++) {
           if(mouseX >i*50+10 && mouseX<i*50+10+40 && mouseY>j*50+10 && mouseY<j*50+10+40) {
             if(!isAFlag[i][j]){
               flags[i][j] = loadImage("flag.png");
               image(flags[i][j], i*50+10, j*50+10, 40, 40);
               isAFlag[i][j] = true;
               nope = false;
             }
             else{
               println("getting rev"+isAFlag[i][j]);
               squares[i][j]= new Square(i*50+10,j*50+10);
             }
            }
       }
     }
  }
  if(keyPressed) {
    if(key == 110) {
      gameOver = false;
      setup();
      
    }
  }
  if(gameOver) {
    for(int i=0; i<col; i++) {
      for(int j=0; j<row; j++) {
        if(isBomb[i][j]){
          bombs[i][j].display();
          totalUncovered = 0;
        }
      }
    }
   fill(color(255,0,0));
   textSize(70);
   text("Game Over", width/5, height/2);
  }
  if((totalUncovered+totalBombs)==(1+dim*dim) || (totalUncovered+totalBombs)==(dim*dim)) {
   fill(color(0,0,255));
   textSize(70);
   text("You win!", width/5, height/2);
   fill(color(0,0,255));
   textSize(30);
   text("Press N to replay", width/5, height/2+25);
    
  }
  
}
  void mouseReleased() {
    nope = true;
  }

