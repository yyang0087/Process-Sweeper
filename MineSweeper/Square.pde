public class Square {
  public Square(int x, int y) {
    xcord = x;
    ycord = y;
    display();
  }
  public Square(int x, int y, int c) {
    xcord = x;
    ycord = y;
    colour = c;
    fill(color(c));
    rect(xcord, ycord, 40, 40);
    //display();
  }
  
 void display() {
   fill(color(180));
   rect(xcord, ycord, 40, 40);
 }
 void changeColor() {
   fill(color(150,40,20));
 }
private int xcord;
private int ycord;
private int colour;
}
