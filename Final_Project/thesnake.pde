class thesnake {

  int bodylength;
  float bodysize;
  String direction;
  ArrayList<Float> snakeX, snakeY;
  boolean outsideboard;
  boolean hititself;
  
  float h= 27;
  float INC= 1;

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
    pushStyle();
    colorMode(HSB);
    fill(h, 255, 255);

    h=h+INC;
    if (h>=315) {
      INC = -INC;
    }
    if (h<27) {
      INC=-INC;
    }

    for (int i=0; i<bodylength; i++) {
      strokeWeight(0);
      ellipse(snakeX.get(i), snakeY.get(i), bodysize, bodysize);
    }
    popStyle();
  }

  void moveSnake() {
    for (int i = bodylength - 1; i>0; i--) {
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
  }

  void getlonger() {
    snakeX.add( snakeX.get(bodylength-1) +bodysize);
    snakeY.add( snakeY.get(bodylength-1) +bodysize);
    bodylength++;
  }

  void hititselfcheck() {
    for (int i = 1; i < bodylength; i++) {
      if ( dist(snakeX.get(0), snakeY.get(0), snakeX.get(i), snakeY.get(i)) < bodysize) {
        hititself = true;
      }
    }
    if (keyPressed) {
      if (key == ' ' && (outsideboard == true || hititself == true)) {
        hititself = false;
        bodylength = 1;
        float xtemp = 200;
        float ytemp = 200;
        snakeX.clear();
        snakeY.clear();
        snakeX.add(xtemp);
        snakeY.add(ytemp);
        direction = "right";
      }
    }
  }

  void checkborder() {
    if (snakeX.get(0) >= 950 || snakeX.get(0) <= 50 || snakeY.get(0) >= 450 || snakeY.get(0) <= 50) {
      outsideboard = true;
    }
    if (keyPressed) {
      if (key == ' ' && (outsideboard == true || hititself == true)) {
        outsideboard = false;
        bodylength = 1;
        float xtemp = 200;
        float ytemp = 200;
        snakeX.clear();
        snakeY.clear();
        snakeX.add(xtemp);
        snakeY.add(ytemp);
        direction = "right";
      }
    }
  }
}