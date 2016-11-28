thesnake snake;

void setup() {
  size(500, 500);
  snake = new thesnake();
  frameRate(20);
  
}

void draw() {
  background(255);
  snake.drawSnake();
  snake.moveSnake();
}

void keyPressed(){
 if(key == CODED){
    if(keyCode == LEFT){
      snake.direction = "left";
    }
    if(keyCode == RIGHT){
      snake.direction = "right";
    }
    if(keyCode == UP){
      snake.direction = "up";
    }
    if(keyCode == DOWN){
      snake.direction = "down";
    }
  }
}