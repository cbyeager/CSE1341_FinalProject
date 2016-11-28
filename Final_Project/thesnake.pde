class thesnake {
 
int bodylength;
float bodysize;
String direction;

ArrayList<Float> snakeX, snakeY;

 thesnake(){
   bodylength = 1;
   bodysize = 10;
   direction = "right";
   snakeX = new ArrayList();
   snakeY = new ArrayList();
   snakeX.add(random(width));
   snakeY.add(random(height));
 }
 
 
 void drawSnake(){
  for (int i=0; i<bodylength; i++){
   strokeWeight(0);
   fill(255,0,0);
    ellipse(snakeX.get(i), snakeY.get(i), bodysize, bodysize); 
  }
  }
 
 void moveSnake(){
   for(int i = bodylength - 1; i>0; i = i-1){
    snakeX.set(i, snakeX.get(i-1));
    snakeY.set(i, snakeY.get(i-1));
   }
   if( direction == "left"){
     snakeX.set(0, snakeX.get(0) - bodysize);
   }
   if( direction == "right"){
     snakeX.set(0, snakeX.get(0) + bodysize);
   }
   if( direction == "up"){
     snakeY.set(0, snakeY.get(0) - bodysize);
   }
   if( direction == "down"){
     snakeY.set(0, snakeY.get(0) + bodysize);
 }
 snakeX.set(0, (snakeX.get(0) + width) % width);
 snakeY.set(0, (snakeY.get(0) + height) % height);
 }

}