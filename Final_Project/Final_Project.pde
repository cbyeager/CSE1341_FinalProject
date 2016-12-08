thesnake snake;
food yum;
int seconds = 5;

void setup() {
  size(1000, 500);
  snake = new thesnake();
  yum = new food();
  frameRate(10);
  
}

void draw() {
  background(0);
  fill(255,0,0);
  rect(50,50,900,400);
  
  
  
  if (snake.outsideboard() == false && snake.hititself() == false){
  snake.drawSnake();
  snake.moveSnake();
  yum.drawfood();
  if(dist(yum.xfood, yum.yfood, snake.snakeX.get(0), snake.snakeY.get(0)) < snake.bodysize){
    yum.newfood();
    snake.getlonger();
  }
  }
  else if (snake.outsideboard() == true | snake.hititself()== true){
    gameOver();
  }
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
    if(keyCode == ENTER){
     
    }
    
  }
}

void gameOver(){
  fill(0);
  rect(0,0,1000,500);
  
  
}