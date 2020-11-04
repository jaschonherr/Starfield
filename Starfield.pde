Particle[] particles = new Particle[500];

void setup() {
  background(0);
  size(600, 600);
  for(int i = 0; i < particles.length; i++) {
    //double a = map((float)i, (float)0, (float)particles.length, (float)0, (float)2*(float)Math.PI);
    particles[i] = new Particle();
    particles[0] = new Oddball();
  }
}

void draw() {
  background(0);
  for(int i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].show();
  }
}
class Oddball extends Particle {

  Oddball () {
    mySize = 0;
    myX = width/2;
    myY = height/2;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = random(10);
  }
  
  void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
    if(myX < 0 || myX > width || myY < 0 || myY > height) {
      mySpeed = 10;
      myX = random(299.9, 300.1);
      myY = random(299.9, 300.1);
      myAngle = Math.random()*2*Math.PI;
    }
    float a = dist((float)myX, (float)myY, 300, 300);
    mySize = map((float)a, 0, 300, 0, 30);
    mySpeed = map((float)a, 0, 300, 0, 20);
  
  }
  
  void show() {
    noStroke();
    fill(41, 33, 12);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
    fill(26, 20, 7);
    ellipse((float)myX + (float)mySize/2, (float)myY + (float)mySize/2, (float)mySize, (float)mySize);
    fill(64, 43, 3);
    ellipse((float)myX - (float)mySize/2, (float)myY + (float)mySize/2, (float)mySize, (float)mySize);
  }
}
class Particle {

  
  double myX, myY, mySpeed, myAngle, mySize;
  
  Particle() {
    mySize = 0;
    myX = random(0, 600);
    myY = random(0, 600);
    myAngle = Math.random()*2*Math.PI;
    mySpeed = random(10);
  }
  
  void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
    if(myX < 0 || myX > width || myY < 0 || myY > height) {
      mySpeed = 10;
      myX = random(299.9, 300.1);
      myY = random(299.9, 300.1);
    }
    float a = dist((float)myX, (float)myY, 300, 300);
    mySize = map((float)a, 0, 300, 0, 10);
    mySpeed = map((float)a, 0, 300, 0, 10);
    //println(mySpeed);
  }
  
  void show() {
    noStroke();
    for(int i = 0; i <= 12; i+=3) {
      int mod;
      if(i > 0) {
        mod = 100;
      } else {
        mod = 255;
      }
      fill(255, 255, 255, mod);
      ellipse((float)myX - (float)Math.cos(myAngle) * i, 
      (float)myY - (float)Math.sin(myAngle) * i, (float)mySize, (float)mySize);
    }
  }
}


