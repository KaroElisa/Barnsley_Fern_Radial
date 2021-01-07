//INFORMATION ABOUT THE BARNSLEY FERN
//https://en.wikipedia.org/wiki/Barnsley_fern
//The Barnsley fern is created by using specific sine and cosine functions to place points in a fern pattern


//BASED ON THIS TUTORIAL BY DANIEL SHIFFMAN
//https://www.youtube.com/watch?v=JFugGF1URNo




// VARIABLE DECLARATIONS

    //Base Variables
      float x = 0;
      float y = 0;

    //X Matrix
      float a = 0.85;
      float b = 0.04;
      float e = 0;

    //Y Matrix
      float c = -0.04;
      float d = 0.85;
      float f = 1.6;

      float g = 60;
      float q = 1;
      float s = PI/6;


//SETUP
    void setup(){
        size(800, 800);
        frameRate(30);
        background(0);
  
    }

//BUILD THE FERN

    void drawPoint(){
       float px = map(x, -4, 4, 0, width);
       float py = map(y, 0, 11, height, 0);
  
       point(px,py);
  
    }

    void nextPoint(){
       float nextX;
       float nextY;
  

//RANDOMLY CHOOSE ONE OF THE FOLLOWING FOUR PATHS TO PLOT THE POINT
    
    float r = random(1);
  
  //1 percent chance
    if (r< 0.01){
      nextX = 0;
      nextY = 0.16*y;
  
  //85 percent chance (add 85 to 1)
    }else if(r<0.86){
      nextX = a * x + b * y + e;
      nextY = c * x + d * y + f;
  
  //7 percent chance
    }else if(r<0.93){
      nextX = 0.2 * x + -0.26 * y;
      nextY = 0.23 * x + 0.22 * y + f;
  
  //other
    }else{
      nextX = -0.15 * x + 0.28 * y;
      nextY = 0.26 * x + 0.24 * y + 0.44;
  }
  
  x = nextX;
  y = nextY;
  
}

//CREATING SPIRALS WITH THE FERNS

void spiral(){
  for(float k = PI/20; k<TWO_PI; k+=PI/20){
  rotate(k);
  
  for(int i = 0; i<20; i++){
   stroke(0, g, 0);
   pushMatrix();
   translate(width-100, 50);
   scale(-1, 1);
   rotate(PI/3);
   drawPoint();
   nextPoint();
   popMatrix();
  }
  
  for(int i = 0; i<20; i++){
   stroke(100, 100, 0);
   pushMatrix();
   translate(width-100, 50);
   scale(-1, 1);
   rotate(PI/3);
   drawPoint();
   nextPoint();
   popMatrix();
  }
  
  g+=0.1;
  
  if (g >200){
    g=200;
  }
  }
}
  
  
  void spiral2(){
  for(float k = PI/20; k<TWO_PI; k+=PI/20){
  rotate(k);
  
  for(int i = 0; i<20; i++){
   stroke(g, g, 0);
   pushMatrix();
   translate(width-100, 50);
   scale(-1, 1);
   rotate(PI/3);
   drawPoint();
   nextPoint();
   popMatrix();
  }
  
  for(int i = 0; i<20; i++){
   stroke(200, 100, 0);
   pushMatrix();
   translate(width-100, 50);
   scale(-1, 1);
   rotate(PI/3);
   drawPoint();
   nextPoint();
   popMatrix();
  }
  
  g+=0.1;
  
  if (g >200){
    g=200;
  }
  }
}
  
  void spiral3(){
  for(float k = PI/20; k<TWO_PI; k+=PI/20){
  rotate(k);
  
  for(int i = 0; i<20; i++){
   stroke(0, g, g, 160);
   pushMatrix();
   translate(width-100, 50);
   scale(-1, 1);
   rotate(PI/3);
   drawPoint();
   nextPoint();
   popMatrix();
  }
  
  for(int i = 0; i<20; i++){
   stroke(100, 38, 203, 160);
   pushMatrix();
   translate(width-100, 50);
   scale(-1, 1);
   rotate(PI/3);
   drawPoint();
   nextPoint();
   popMatrix();
  }
  
  g+=0.1;
  
  if (g >200){
    g=200;
  }
  }
}  
  
  void draw(){
  strokeWeight(2);  

    scale(0.2);
    translate(2000, 2000);
    
    pushMatrix();
    for (int i=2; i<30; i++){
    scale(i*0.3);
    spiral2();
    scale(i*0.4);
    spiral();
    scale(0.8);
    spiral3();
    } 
    popMatrix();
    
}
