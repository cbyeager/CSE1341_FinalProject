//Carson Yeager 45353260
//CSE 1341- Final Project
//Some of the logic for changing the direction of the snake and making it move was made refrencing Katherine Quinlivan's 
//snake game on open processing. https://www.openprocessing.org/sketch/106774 . All else is origional.
thesnake snake;
food yum;
int highscore = 0;
int speed = 10;
void setup() {
  size(1000, 500);
  snake = new thesnake();
  yum = new food();
  frameRate(speed);
}

void draw() {
  background(0);
  fill(255, 0, 0);
  rect(50, 50, 900, 400);
  fill(255);
  textSize(32);
  text("Snake: by Carson Yeager", 600, 485);
  score();
  snake.hititselfcheck();
  snake.checkborder();
  nofoodoverlap();

  if (snake.outsideboard == false && snake.hititself == false) {
    snake.drawSnake();
    snake.moveSnake();
    yum.drawfood();

    if (dist(yum.xfood, yum.yfood, snake.snakeX.get(0), snake.snakeY.get(0)) < snake.bodysize) {
      yum.newfood();
      snake.getlonger();
    }
  }
  if (snake.outsideboard == true | snake.hititself== true) {
    gameOver();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      snake.direction = "left";
    }
    if (keyCode == RIGHT) {
      snake.direction = "right";
    }
    if (keyCode == UP) {
      snake.direction = "up";
    }
    if (keyCode == DOWN) {
      snake.direction = "down";
    }
  }
}

void gameOver() {

  fill(255);
  textSize(100);
  text(" You Lost!", 230, 250);
  textSize(30);
  text("Try Again? Press Space Bar", 300, 300);
}

void score() {
  textSize(32);
  text("Mr. Snake has eaten      pieces of food!", 10, 32); 
  text(snake.bodylength -1, 332, 32);
  text("Highscore:", 10, 480);
  if ( (snake.bodylength - 1) > highscore) {
    highscore = highscore + 1;
  }
  text(highscore, 180, 480);
}

void nofoodoverlap() {
  //for (int i = 1; i < snake.bodylength; i++) {
    //if (abs(yum.xfood - snake.snakeX.get(i)) <= .5 | abs(yum.yfood - snake.snakeY.get(i))<= .5) {
      //yum.newfood();
   // }
 // }
}

void speed() {
}