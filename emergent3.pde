int _num = 50;
float angle = 0;
Circle[] _circleArr = {};
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage bg;

void setup() {
 size(945, 708);
 bg = loadImage("whitenoise2.jpg");
 smooth();
 strokeWeight(1);
 fill(150, 50);
 frameRate(10);
 img = loadImage("shape1.png");
 img1 = loadImage("shape2.png");
 img2 = loadImage("shape3.png");
 img3 = loadImage("shape4.png");
 img4 = loadImage("shape5.png");
 img5 = loadImage("shape6.png");
 img6 = loadImage("shape7.png");
 img7 = loadImage("shape8.png");
 img8 = loadImage("shape9.png");
 
 drawCircles();
}

void draw() {
  background(bg);
  for(int i=0; i < _circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
 // saveFrame();
}

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(95) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    xmove = random(8) - 5;
    ymove = random(8) - 5;
  }
  
  void drawMe() {
   noStroke();
   fill(fillcol, alph);
   ellipse(x, y, radius * 2, radius *2);
   stroke(linecol, 150);
   noFill();
   ellipse(x, y, 10, 10);
 }

 void updateMe() {
  float pathsel = random(2);
  if(pathsel == 0) {
   angle++; 
   x += xmove;
   float rad = radians(angle);
   y = ymove + 45 + (sin(rad) * 40);
  }
  else if(pathsel == 1) {
   x += xmove;
   y += ymove;
  }
  else if(pathsel == 2) {
   angle++;
   x += xmove;
   float rad = radians(angle);
   y = ymove + 45 + (pow(sin(rad), 3) * 30);
  }
  else {
   x += xmove;
   y += ymove; 
  }  
  if(x > (width + radius)) { x = 0 - radius;}
  if(x < (0 - radius)) { x = width + radius;}
  if(y > (height + radius)) { y = 0 - radius;}
  if(y < (0 - radius)) { y = height + radius;}
 
  for(int i = 0; i < _circleArr.length; i++) {
    Circle otherCirc = _circleArr[i];
    if(otherCirc != this) {
      float dis = dist(x, y, otherCirc.x, otherCirc.y);
      float overlap = dis - radius - otherCirc.radius;
      if(overlap < 0) {
        float midx, midy;
        midx = (x + otherCirc.x)/2;
        midy = (y + otherCirc.y)/2;
       // stroke(0,100);
       // noFill();
       // overlap *= -1;
       int size = int(random(9));
       if(size == 0) {  
          image(img, midx, midy);
       }
       else if(size == 1) {
          image(img1, midx, midy);  
       }
       else if(size == 2) {
          image(img2, midx, midy);  
       }
       else if(size == 3) {
          image(img3, midx, midy);  
       }
       else if(size == 4) {
          image(img4, midx, midy);  
       }
       else if(size == 5) {
          image(img5, midx, midy);  
       }
       else if(size == 6) {
          image(img6, midx, midy);  
       }
       else if(size == 7) {
          image(img7, midx, midy);  
       }
       else if(size == 8) {
          image(img8, midx, midy);  
       }
       else {
          image(img, midx, midy);  
       }
       //int rndx = int(random(50));
       //int rndy = int(random(10));
       //img.resize(rndx, rndy);
       // ellipse(midx, midy, overlap, overlap);
      }
    }
  }
  // drawMe();
 }
}

void drawCircles() {
  for (int i=0; i < _num; i++) {
  Circle thisCirc = new Circle();
//  thisCirc.drawMe(); 
  _circleArr = (Circle[])append(_circleArr, thisCirc);
 }
}
