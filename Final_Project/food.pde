class food {

  float xfood, yfood;
  int size = 10;

  food() {
    xfood= random(80, width-80);
    yfood= random(80, height-80);
  }

  void drawfood() {
    fill(255);
    strokeWeight(0);
    rect(xfood, yfood, size, size);
  }

  void newfood() {
    xfood= random(80, width-80);
    yfood= random(80, height-80);
  }
}