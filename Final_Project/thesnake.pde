class thesnake {

  int bodylength;
  float bodysize;
  String direction;
  ArrayList<Float> snakeX, snakeY;
  


  thesnake() {
    bodylength = 1;
    bodysize = 20;
    direction = "right";
    snakeX = new ArrayList();
    snakeY = new ArrayList();
    snakeX.add(random(100, 200));
    snakeY.add(random(100, 200));
  }





  void drawSnake() {
    for (int i=0; i<bodylength; i++) {
      strokeWeight(0);
      fill(0, 0, 255);
      rect(snakeX.get(i), snakeY.get(i), bodysize, bodysize);
    }
  }




  void moveSnake() {


    for (int i = bodylength - 1; i>0; i = i-1) {
      snakeX.set(i, snakeX.get(i-1));
      snakeY.set(i, snakeY.get(i-1));
    }
    if ( direction == "left") {
      snakeX.set(0, snakeX.get(0) - bodysize);
    }
    if ( direction == "right") {
      snakeX.set(0, snakeX.get(0) + bodysize);
    }
    if ( direction == "up") {
      snakeY.set(0, snakeY.get(0) - bodysize);
    }
    if ( direction == "down") {
      snakeY.set(0, snakeY.get(0) + bodysize);
    }

    snakeX.set(0, (snakeX.get(0) + width) % width);
    snakeY.set(0, (snakeY.get(0) + height) % height);

    if ( hititself() == true) {
      bodylength = 1;
      background(0);
    }
    if (outsideboard() == true) {
      bodylength = 1;
    }
  }





  void getlonger() {
    snakeX.add( snakeX.get(bodylength-1) +bodysize);
    snakeY.add( snakeY.get(bodylength-1) +bodysize);
    bodylength++;
  }




  boolean hititself() {
    for (int i = 1; i < bodylength; i++) {
      if ( dist(snakeX.get(0), snakeY.get(0), snakeX.get(i), snakeY.get(i)) < bodysize) {
        return true;
      }
    } 

    return false;
  }


  boolean outsideboard() {
    if (snakeX.get(0) >= 930 || snakeX.get(0) <= 50 || snakeY.get(0) >= 430 || snakeY.get(0) <= 50) {
      return true;
    } else { 
      return false;
    }
  }

void negate(){
 outsideboard() == 1outsideboard(); 
}


  void keyPressed() {
   //check1 = !check1;
  }
}