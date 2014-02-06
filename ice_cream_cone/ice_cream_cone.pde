import processing.pdf.*;

//rectangle
float recInterval, recWidth, recHeight, gap;

//circle
float cirStrokeWeight, diameter, cirNoff;
float beginWidth, beginHeight;
float cirWidth, cirHeight;

//triangle
float angleRotate, triSize, triNoff;
float wholeCenterX, wholeCenterY;
PVector [] centerP = new PVector[100];
PVector magicPoint;
float ang;

void setup() {
  //size(600, 848, PDF, "filename.pdf");
  size(600, 848);
  background(255);
  cirWidth = 232;
  cirHeight = 52;
  beginWidth = (width - cirWidth)/2;
  beginHeight = 280;
  cirNoff = 10;

  gap = 90;
  recInterval = 0;

  triSize = 2;
  triNoff = 0;
  ang = 0;
  wholeCenterX = 180;
  wholeCenterY = 195;
  angleRotate = 10;
  magicPoint = new PVector(100,195);

 // translate(10,100);
  //----------------------------------------------------------------------------
  pushMatrix();
  //translate(wholeCenterX, wholeCenterY);
  //rotate(angleRotate);
 noStroke();
  for (int m=0; m<10; m++) {
    for (int n=0; n<10; n++) {
      centerP[n*10+m]=new PVector ((m+100)+22*m, (n+110)+22*n);
    }
  }
   
  for (int i=0; i<100; i++) {
  
      //point(centerP[i].x, centerP[i].y);
    float dis = dist(centerP[i].x, centerP[i].y, wholeCenterX, wholeCenterY);
    //centerP[i].x+=i%8+map(sin(ang),-1,1,-10,10);
    triSize = map(sin(triNoff), -1, 1, 6, 3);
    if (dis<= 80 ) {
      fill(0);
    }
    else {
      noFill();
    }
  translate(wholeCenterX, wholeCenterY);
  rotate(angleRotate);
  triangle(centerP[i].x, centerP[i].y-2*triSize, centerP[i].x-sqrt(3)*triSize, centerP[i].y+triSize, centerP[i].x+sqrt(3)*triSize, centerP[i].y+triSize);
  triNoff += 0.1;
  ang += 1;

}
stroke(255,100,10);
strokeWeight(10);
point(magicPoint.x,magicPoint.y);
popMatrix();

//head of the cone----------------------------------------------------------------------------
fill(0);
for (float b = beginHeight + cirHeight +10; b< 840; b += recInterval) {
  float lastHeight = b;
  recInterval = map(gap*gap*gap, 729000, 0, 60, 1);
  gap -= 5;
  if (gap <= 0) {
    gap = 0;
  }

  float theta = atan((cirWidth/2) / (600-beginHeight-cirHeight-10));
  float halfWidth = tan(theta) * (600-lastHeight-10 - recInterval);  
  if (halfWidth >= 0) { 
    float a = beginWidth + cirWidth/2 - halfWidth;
    recWidth = halfWidth * 2;
    recHeight = map(recInterval, 1, 120, 1, 60);

    if (lastHeight > 450 && lastHeight < 500) {

      if (lastHeight < 700) {
        float disrupt = random(-6, 0);
        recHeight += disrupt;
      }

      if (recHeight <= 1) {
        recHeight = 1;
      }

      float flipCoin = random(0, 1);
      if (flipCoin < 0.5) {
        noFill();
      }
      else {
        fill(0);
      }
    }

    else {
      fill(0);
    }

    noStroke();
    rect(a, b, recWidth, recHeight);
    lastHeight += recInterval;
  }
}

//bottom of the cone----------------------------------------------------------------------------
noFill();
for (float x = beginWidth; x < beginWidth + cirWidth; x += 10) {
  for (float y = beginHeight; y < beginHeight + cirHeight; y += 10) {
    cirStrokeWeight = map(noise(cirNoff), 0, 1, 0, 2) - 0.4;
    diameter = map(noise(cirNoff), 0, 1, 1, 7);
    if (cirStrokeWeight <= 0.3) {
      noStroke();
    }
    else {
      stroke(0);
      strokeWeight(cirStrokeWeight);
    }
    ellipse( x, y, diameter, diameter);
    cirNoff += 0.1;
  }
}
//exit();
}

void draw() {
}

