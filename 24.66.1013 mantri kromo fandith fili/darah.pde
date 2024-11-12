class darah {
  PVector pos;
  PVector vel;
  float x, y;
  float opacity = 255;
  int spawnTime;
  
   darah(PImage _img, float _x, float _y) {
    imgdarah = _img;
    x = _x;
    y = _y;
    spawnTime = millis();
    imgdarah = loadImage("blood.png");
   }

  void display() {
    int elapsedTime = millis() - spawnTime;

    
    opacity = map(elapsedTime, 0, 3000, 255, 0);
    opacity = constrain(opacity, 0, 255); 

    
    pushMatrix();      
    imageMode(CENTER);  
    tint(255, opacity); 
    image(imgdarah, x, y);
    popMatrix();      

    noTint();
  }
    
  boolean isFaded() {
    return opacity <= 0;
  }
}
