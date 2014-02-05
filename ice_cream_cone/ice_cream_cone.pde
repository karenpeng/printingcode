import processing.pdf.*;

//rectangle
float recInterval, recWidth, recHeight, ang, gap, recNoff;

//circle
float cirStrokeWeight, diameter, cirNoff;
float beginWidth, beginHeight;
float cirWidth, cirHeight;

//triangle
float angleLittleX, angleLittleY, angleRotate, centerX, centerY, triSize, triNoff;
float beginX, beginY;
float a1, a2, a3, a4, a5, a6;

void setup() {
  //size(600, 848, PDF, "filename.pdf");
  size(600, 848);
  background(255);
  cirWidth = 232;
  cirHeight = 52;
  beginWidth = (width - cirWidth)/2;
  beginHeight = 280;
  cirNoff = 10;

  ang = 0;
  gap = 90;
  recInterval = 0;
  recNoff = 0;

  triSize = 5;
  beginX = 140;
  beginY = 100;
  angleLittleX = 0;
  angleLittleY = -PI/2;
  a1 = PI/2;
  a2 = PI/2;
  a3 = PI/2;
  a4 = PI/2;
  a5 = PI/2;
  a6 = PI/2;  
  angleRotate = 10;
  //----------------------------------------------------------------------------
  pushMatrix();
  //translate(beginX+80, beginY+80);
  //rotate(angleRotate);

  for (float m = beginX; m < beginX+160; m+=30) {
    for (float n = beginY; n < beginY+160; n+=30) {
      centerX = m+map(sin(angleLittleX), -1, 1, -30, 30);
      float dd = map(sin(angleLittleY), -1, 1, -20, 20);
      //if(sin(angleLittleY) >= 0){
      if ( n <=beginY) {
        centerY = n-map(sin(angleLittleY), -1, 1, -20, 20);
        fill(0);
      }
      else if (n <= beginY+30) {
        centerY = n-map(sin(angleLittleY), -1, 1, -10, 10);
        fill(50);
      }
      else if (n <= beginY+2*30) {        
        centerY = n-sin(angleLittleY);
        fill(100);
      }
      else if(n <= beginY+3*30){
              centerY = n+sin(angleLittleY);
              fill(150);
  
      }
      //}
            else if(n <= beginY+4*30){
              centerY = n+map(sin(angleLittleY), -1, 1, -10, 10);
              fill(200);
  
      }
      else{
      centerY = n+map(sin(angleLittleY), -1, 1, -20, 20);
      noFill();
      stroke(0);
      }
      //centerX = m;
      //centerY = n;
      if (1>4) {
        noFill();
      }
      else {
        //fill( map((n+m), beginX+beginY, beginX+beginY+320, 250, 10));
      }
      triangle(centerX, centerY-2*triSize, centerX-sqrt(3)*triSize, centerY+triSize, centerX+sqrt(3)*triSize, centerY+triSize);
      angleLittleX += 1.01;
      angleLittleY += 0.14;
      a1 += 0.1;
      a5 += 0.1;

      //println(sin(angleLittle), cos(angleLittle));
      println(sin(angleLittleX));
    }
    /*
    if(){
     }
     else if(){
     }
     else{
     }
     */
    //triangle(centerX, centerX-2*triSize, centerX-sqrt(3)*triSize, b+triSize, centerX+sqrt(3)*triSize, b+triSize);
  }
  popMatrix();

  //----------------------------------------------------------------------------
  fill(0);
  for (float b = beginHeight + cirHeight +10; b< 840; b += recInterval) {
    float lastHeight = b;
    //recInterval = map(cos(ang), 1, 0, 80, 10);
    //recInterval = random(30, 140);
    recInterval = map(gap*gap*gap, 729000, 0, 60, 1);
    gap -= 5;
    if (gap <= 0) {
      gap = 0;
    }

    float theta = atan((cirWidth/2) / (840-beginHeight-cirHeight-10));
    float halfWidth = tan(theta) * (840-lastHeight-10 - recInterval);  
    if (halfWidth >= 0) { 
      float a = beginWidth + cirWidth/2 - halfWidth;
      recWidth = halfWidth * 2;
      //recHeight = map(cos(ang), -1, 1, 8, 60);
      recHeight = map(recInterval, 1, 120, 1, 60);

      if (lastHeight > 450 && lastHeight < 760) {

        if (recHeight <= 1) {
          recHeight = 1;
        }
        float flipCoin = random(0, 1);
        //recHeight = 10;
        //recHeight = map(noise(recInterval), 0, 1, 1, 30);
        //recHeight = random(10, 30);
        if (flipCoin < 0.5) {
          noFill();
        }
        else {
          fill(0);
        }

        if (lastHeight < 700) {
          //float disrupt = map(noise(recNoff), 0, 1, -20, 10);
          float disrupt = random(-6, 0);
          recHeight += disrupt;
        }
      }
      else {
        fill(0);
      }


      noStroke();
      rect(a, b, recWidth, recHeight);
      lastHeight += recInterval;
      ang += .09;
      recNoff += 0.1;
    }
  }

  //----------------------------------------------------------------------------
  noFill();
  for (float x = beginWidth; x < beginWidth + cirWidth; x += 10) {
    for (float y = beginHeight; y < beginHeight + cirHeight; y += 10) {
      cirStrokeWeight = map(noise(cirNoff), 0, 1, 0, 2) - 0.4;
      diameter = map(noise(cirNoff), 0, 1, 1, 7);
      if (cirStrokeWeight <= 0.15) {
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

