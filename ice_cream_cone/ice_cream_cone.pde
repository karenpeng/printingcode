//rectangle
float recInterval, recWidth, recHeight, ang, gap, recNoff;

//circle
float cirStrokeWeight, diameter, cirNoff;
float beginWidth, beginHeight;
float cirWidth, cirHeight;

//triangle
float angle, centerX, centerY, triSize, triNoff;

void setup() {
  size(600, 848);
  background(255);
  cirWidth = 232;
  cirHeight = 52;
  beginWidth = (width - cirWidth)/2;
  beginHeight = 280;
  cirNoff = 10;

  ang = 0;
  gap = 100;
  recInterval = 0;
  recNoff = 0;

//----------------------------------------------------------------------------
  fill(0);
  for (float b = beginHeight + cirHeight +10; b< 840; b += recInterval) {
    float lastHeight = b;
    //recInterval = map(cos(ang), 1, 0, 80, 10);
    //recInterval = random(30, 140);
    recInterval = map(gap*gap*gap, 1000000, 0, 60, 1);
    gap -= 8;
    if (gap <= 0) {
      gap = 0;
    }

    float theta = atan((cirWidth/2) / (840-beginHeight-cirHeight-10));
    float halfWidth = tan(theta) * (840-lastHeight-10 - recInterval);   
    float a = beginWidth + cirWidth/2 - halfWidth;
    recWidth = halfWidth * 2;
    //recHeight = map(cos(ang), -1, 1, 8, 60);
    recHeight = map(recInterval, 1, 120, 1, 60);

    if (lastHeight > 450 && lastHeight < 760) {
      //float disrupt = map(noise(recNoff), 0, 1, -20, 10);
      float disrupt = random(-20, 6);
      //recHeight += disrupt;
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
  
//----------------------------------------------------------------------------
  noFill();
  for (float x = beginWidth; x < beginWidth + cirWidth; x += 10) {
    for (float y = beginHeight; y < beginHeight + cirHeight; y += 10) {
      cirStrokeWeight = map(noise(cirNoff), 0, 1, 0, 2) - 0.5;
      diameter = map(noise(cirNoff), 0, 1, 1, 7);
      if (cirStrokeWeight <= 0) {
        noStroke();
      }
      else {
        stroke(0);
        strokeWeight(cirStrokeWeight);
      }
      ellipse( x, y, diameter, diameter);
      cirNoff +=0.1;
    }
  }
}

void draw() {
}

