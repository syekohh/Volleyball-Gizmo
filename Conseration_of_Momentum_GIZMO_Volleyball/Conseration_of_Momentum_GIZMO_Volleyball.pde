boolean firstRun = true;
int x = 1000, y = 300;
int xHeadRS = (x/2) + (x/20);
int xHeadR = (x/2) + (x/4);
int xPeak = (xHeadRS + xHeadR)/2;
int buttonCorner = 900;
float yArms = 259;
float xBall = 1000/8.5;
float yBall = (y/2) - y/5;

boolean peak = false;

boolean light = false;
boolean highSchool = false;
boolean pro = false;

boolean contact = false;

void setup() {
  //(width, height)
  size(1000, 300);
  background(#5D9CB4);
  //int x = width, y = height;
  frameRate(60);
}
void court(int x, int y) {
  //background(#5D9CB4);
  fill(#F28D64);
  //(0, a third from the bottom, x, y/3)
  int xCo = x/10;
  int yCo = (y-(y/20));
  int xLength = (x-(x/5));
  int yLength = y/20;
  stroke(#FFFFFF);
  strokeWeight(1);
  rect(xCo, yCo, xLength, yLength);
  strokeWeight(0.5);
  fill(#5D9CB4);
  rect(0, yCo, x/10, yLength);
  rect((x-(x/10)), yCo, x/10, yLength);
  net(x, y);
}

void net(int x, int y) {
  int xMid = x/2;
  int yMid = y/2;
  int yMidCourt = (y-(y/20));
  stroke(0);
  strokeWeight(5);
  line(xMid, yMid, xMid, yMidCourt);
  setters(x, y, yMid, yMidCourt);
}

void setters(int x, int y, int yMid, int yMidCourt) {
  int xHeadSS = (x/2) - (x/20);
  int xHeadRS = (x/2) + (x/20);
  float yHead = ((yMid + yMidCourt)/2.35);
  int headSize = (y/7);
  float botHead = yHead + headSize/2;
  int bodyLength = y-(y/7);
  float midBody = (botHead + bodyLength)/2;
  strokeWeight(1);
  // head
  ellipse(xHeadSS, yHead, headSize, headSize);
  // body
  line(xHeadSS, botHead, xHeadSS, bodyLength);
  // arms
  line(xHeadSS, midBody, xHeadSS+(x/50), botHead);
  line(xHeadSS, midBody, xHeadSS-(x/50), botHead);
  // legs
  line(xHeadSS, bodyLength, xHeadSS+(x/50), (y-(y/20)));
  line(xHeadSS, bodyLength, xHeadSS-(x/50), (y-(y/20)));

  // head
  ellipse(xHeadRS, yHead, headSize, headSize);
  // body
  line(xHeadRS, botHead, xHeadRS, bodyLength);
  // arms
  line(xHeadRS, midBody, xHeadRS+(x/50), botHead);
  line(xHeadRS, midBody, xHeadRS-(x/50), botHead);
  // legs
  line(xHeadRS, bodyLength, xHeadRS+(x/50), (y-(y/20)));
  line(xHeadRS, bodyLength, xHeadRS-(x/50), (y-(y/20)));
}

void receiver(int x, int y) {

  int xHeadR = (x/2) + (x/4);
  float yHeadR = (y/2 + y/6);
  int headSize = (y/7);
  float xBodyStart = (xHeadR + (xHeadR + headSize))/2.031;
  float yBodyStart = (yHeadR + (yHeadR + headSize))/2.001;
  int bodyLength = y-(y/7);
  float xBodyEnd = xBodyStart + x/55;
  float xBodyMid = (xBodyStart + xBodyEnd)/2;
  float yBodyMid = (yBodyStart + bodyLength)/2;
  float xArms = xBodyMid - x/20;
  if (firstRun) {
    float yArms = yBodyMid + y/15;
    println(yArms);
  }
  //head
  ellipse(xHeadR, yHeadR, headSize, headSize);
  //body
  line(xBodyStart, yBodyStart, xBodyEnd, bodyLength);
  //legs
  line(xBodyEnd, bodyLength, xBodyEnd + x/50, (y-(y/20)));
  line(xBodyEnd, bodyLength, xBodyEnd - x/50, (y-(y/20)));
  //arms
  strokeWeight(3);
  line(xBodyMid, yBodyMid, xArms, yArms);
  strokeWeight(1);
  firstRun = false;
}

void server(int x, int y) {
  int headSize = (y/7);
  int xHeadS = x/15;
  int yHeadS = (y/2) - y/15;
  float bodyLength = y-(y/2.5);
  int xBodyEnd = (xHeadS + x/100) + x/75;
  int xMidRightLeg = (xHeadS + xBodyEnd)/2;
  float xMidBody = ((xHeadS + x/100) + xBodyEnd)/2;
  float yMidBody = (yHeadS + (headSize - y/13) + bodyLength)/2;
  //head
  ellipse(xHeadS, yHeadS, headSize, headSize);
  //body
  line(xHeadS + x/100, yHeadS + (headSize - y/13), xBodyEnd, bodyLength);
  //legs
  //right
  line(xBodyEnd, bodyLength, xBodyEnd, (y/3)*2.03);
  line(xBodyEnd, (y/3)*2.03, xHeadS, ((y/3)*2.03)+y/30);
  //left
  line(xBodyEnd, bodyLength, xMidRightLeg + x/150, (y/3)*2.03);
  line(xMidRightLeg + x/150, (y/3)*2.03, xHeadS, ((y/3)*2.03)+y/70);
  //arms
  //hitting
  line(xMidBody, yMidBody, xHeadS - x/100, yMidBody);
  line(xHeadS - x/100, yMidBody, x/30, yHeadS + (headSize - y/13));
  //other
  line(xMidBody, yMidBody, xHeadS + headSize, (yHeadS + (headSize - y/13)) - y/13);
}

void draw() {
  background(#5D9CB4);

  fill(#5FD674);
  rect(450, 10, 100, 30);
  textSize(16);
  fill(#5D9CB4);
  text("Reset", 479, 31);

  fill(#5FD674);
  rect(buttonCorner, 10, 70, 30);
  textSize(16);
  fill(#5D9CB4);
  text("Light", 917, 31);

  fill(#5FD674);
  rect(buttonCorner, 50, 70, 30);
  textSize(15);
  fill(#5D9CB4);
  text("H.School", 905, 70);

  fill(#5FD674);
  rect(buttonCorner, 90, 70, 30);
  textSize(16);
  fill(#5D9CB4);
  text("Pro", 921, 110);

  court(x, y);
  receiver(x, y);
  server(x, y);

  float xIncL = 1.1, yIncL = 3;
  float xIncHS = 1.35, yIncHS = 3;
  float xIncP = 1, yIncP = 3;
  float yDec = 3.5;

  if (mousePressed && mouseX > 450 && mouseX < 550 && mouseY > 10 && mouseY < 40) {
    xBall = 1000/8.5;
    yBall = (y/2) - y/5;
    light = false;
    highSchool = false;
    pro = false;
    yArms = 259;
    contact = false;
  }

  if (mousePressed && mouseX > buttonCorner && mouseX < 970) {

    if (mousePressed && mouseY > 10 && mouseY < 40) {
      light = true;
      highSchool = false;
      pro = false;
    }
    if (mousePressed && mouseY > 50 && mouseY < 80) {
      light = false;
      highSchool = true;
      pro = false;
    }
    if (mousePressed && mouseY > 90 && mouseY < 120) {
      light = false;
      highSchool = false;
      pro = true;
    }
  }

  fill(#E7FC00);
  ellipse(xBall, yBall, x/30, x/30);

  if (light && !contact) xBall+=3;
  if (highSchool && !contact) xBall+=5;
  if (pro && !contact) xBall+=10;

  if (xBall > x/2 && light && !contact) yBall+=2;
  if (xBall > x/2 && highSchool && !contact) yBall+=3.25;
  if (xBall > x/2 && pro && !contact) yBall+=7.3;

  if ((yBall + x/30) >= yArms + 10) contact = true;

  if (light && contact) {

    if (yArms < 265) yArms+=1;
    xBall-=xIncL;
    yBall-=yIncL;
    if (xBall <= xPeak) {
      yBall+=yDec;
      if (xHeadRS >= xBall) light = false;
    }
  } else if (highSchool  && contact) {

    if (yArms < 270) yArms+=2;
    xBall-=xIncHS;
    yBall-=yIncHS;
    if (xBall <= xPeak) {
      yBall+=yDec;
      if (xHeadRS >= xBall) highSchool = false;
    }
  } else if (pro  && contact) {

    if (yArms < 275) yArms+=10;
    xBall-=xIncP;
    yBall-=yIncP;
    if (xBall <= xPeak) {
      yBall+=yDec;
      if (xHeadRS >= xBall) pro = false;
    }
  }
}
