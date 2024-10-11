Die bob;
int totalRoll = 0;
void setup(){
  noLoop();
  size(700, 700);
}

void draw(){
  background(#ecff00);
  for(int y = 0; y <= 600; y += 100){
    for(int x = 0; x <= 600; x += 100){
      Die bob = new Die(x, y);
      bob.roll();
      bob.show();
    }
   }
 
   fill(#93758a);
  textSize(100);
  text("Total: " + totalRoll, 120, 550);


}

void mousePressed(){
  totalRoll = 0;
  redraw();
}

class Die{
  int myX, myY;
  int roll = 0;
  Die(int x, int y)
{
    myX = x;
    myY = y;
}
  void roll(){
    roll = (int)(Math.random()*6+1);
    totalRoll = totalRoll + roll;
  }
  void show(){
   noStroke();
    fill(#3e00ff);
    rect(myX, myY, 100, 100, 30);
    fill(#dca8dc);
    if(roll == 1){
      star(myX+50, myY+50, 10, 30, 4);
    } else if(roll == 2){
      for(int i=0; i <= 50; i+=50){
        star(myX+50, myY+25+i, 6, 14, 3.5);
      }
    } else if(roll == 3){
    for(int i=0; i < roll*30 && i < 90; i+=30){
        star(myX+50, myY+20+i, 6, 14, 10.2);
      }
    } else if(roll == 4){
      for(int i=0; i <= 50; i+=50){
        star(myX+25, myY+25+i, 6, 14, 2);
        star(myX+75, myY+25+i, 6, 14, 2);
      }
    } else if(roll == 5){
      star(myX+50, myY+50, 6, 14, 5);
      for(int i=0; i <= 50; i+=50){
        star(myX+25, myY+25+i, 6, 14, 5);
        star(myX+75, myY+25+i, 6, 14, 5);
      }
    } else {
      for(int i=0; i < roll*30 && i < 90; i+=30){
        star(myX+25, myY+20+i, 2, 6, 4.5);
        star(myX+75, myY+20+i, 2, 6, 4.5);
      }
    }
  }
}
void star(float x, float y, float radius1, float radius2, float npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
