import processing.pdf.*;

/*
import controlP5.*;
ControlP5 GUI;
*/

//rectangle
float recInterval, recWidth, recHeight, gap, recNoff;
float beginWidth, beginHeight;
float cirWidth, cirHeight;

//triangle
float angleRotate, triSize, triNoff;
float wholeCenterX, wholeCenterY;
PVector [] centerP = new PVector[100];


void setup() {
  //size(600, 848,PDF, "filename.pdf");
  size(600,848);
  background(255);

  triSize = 2;
  triNoff = 0;

  wholeCenterX = 162.62;
  wholeCenterY = 168.68;
  angleRotate = 3.83;

  cirWidth = 232;
  //cirHeight = 280;
  beginWidth = (width - cirWidth)/2;
  beginHeight = 366;
  recNoff = 10;

  gap = 100;
  recInterval = 0;
/*
  GUI=new ControlP5(this);
  GUI.addSlider("wholeCenterX").setPosition(10, 10).setRange(100, 300.00);
  GUI.addSlider("wholeCenterY").setPosition(10, 20).setRange(100, 300.00);
  GUI.addSlider("angleRotate").setPosition(10, 30).setRange(0, 20);
*/
//  }
//  void draw() {
//  background(255);
  noStroke();

  //cone------------------------------------------------------------------------------------------

  fill(0);
  translate(6, 60);
  for (float b = beginHeight + cirHeight +10; b< 840; b += recInterval) {
    float lastHeight = b;
    recInterval = map(gap*gap*gap, 1000000, 0, 70, 1);
    gap -= 9;
    if (gap <= 0) {
      gap = 0;
    }

    float theta = atan((cirWidth/2) / (680-beginHeight-cirHeight-10));
    float halfWidth = tan(theta) * (680-lastHeight-10 - recInterval);  
    if (halfWidth >= 0) { 
      float a = beginWidth + cirWidth/2 - halfWidth;
      recWidth = halfWidth * 2;
      recHeight = map(recInterval, 1, 70, 1, 50);
      
      if (lastHeight>400 && lastHeight<620) {
        recHeight += map(noise(recNoff), 0, 1, -24, 1);
      }
      if (recHeight<=1) {
        recHeight = 1;
      }
      
      noStroke();
      rect(a, b, recWidth, recHeight);
      lastHeight += recInterval;
    }
    recNoff+=0.1;
  }

  //ice cream ------------------------------------------------------------------

  for (int m=0; m<10; m++) {
    for (int n=0; n<10; n++) {
      centerP[n*10+m]=new PVector ((m+100)+22*m, (n+110)+22*n);
    }
  }
  pushMatrix();
  for (int h = 0; h<2; h++) {
    if (h==0) {
      translate(320, 240);
      scale(0.55);
    }
    else {
      fill(255);
      ellipse(-120, 40, 550, 550);

      translate(-400, -100);
      scale(1.75);
    }

    pushMatrix();
    for (int i=0; i<100; i++) {
      float dis = dist(centerP[i].x, centerP[i].y, wholeCenterX, wholeCenterY);
      if (dis<= 80 ) {
        fill(0);
      }
      else {
        noFill();
      }
      translate(wholeCenterX, wholeCenterY);
      rotate(angleRotate);

      triSize = random(4, 9);
      triangle(centerP[i].x, centerP[i].y-2*triSize, centerP[i].x-sqrt(3)*triSize, centerP[i].y+triSize, centerP[i].x+sqrt(3)*triSize, centerP[i].y+triSize);

      triNoff += 1;
    }
    popMatrix();
  }
  popMatrix();
  
  //exit();
  save("helloworld.jpg");
}

