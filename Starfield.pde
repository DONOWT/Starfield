Projectile[] sue;
void setup() {
  noStroke();
  size(1000, 1000);
  sue = new Projectile[5000];
  for (int i = 0; i < sue.length; i++) {
    sue[i] = new Projectile();
    sue[i].myX = Math.random()*1000;
    sue[i].myY = Math.random()*1000;
  }
  for (int i = 0; i < 20; i++) {
    sue[i] = new superball();
  }
}
void draw() {
  background(0, 0, 200);
  for (int i = 0; i < sue.length; i++) {
    sue[i].move();
    sue[i].show();
    if ((sue[i].myX > 1000)||(sue[i].myY > 1000)||(sue[i].myX < 0)||(sue[i].myY < 0)) {
      sue[i].myX = mouseX;
      sue[i].myY = mouseY;
    }
  }
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 50, 50);
}

class Projectile {
  double myX, myY, rotation, speed;
  int Color, size;
  Projectile() {
    myX = mouseX;
    myY = mouseY;
    rotation = Math.random() * 2 * PI;
    speed = 1;
    Color = 200;
    size = (int)(Math.random()*3)+5;
}
void move() {
  myX = (myX + speed * Math.cos(rotation));
  myY = (myY + speed * Math.sin(rotation));
}
void show() {
  fill(Color, Color, 255);
  ellipse((float)myX, (float)myY, size, size);
}
}
class superball extends Projectile {
  superball() {
    myX = Math.random()*1000;
    myY = Math.random()*1000;
    rotation = Math.random() * 2 * PI;
    speed = 1.1;
    Color = 255;
    size = 10;
  } void move() {
    myX = (myX + speed * Math.cos(rotation));
    myY = (myY + speed * Math.sin(rotation));
    if (myX > 1000 || myY > 1000 || myX < 0 || myY < 0) {
      myX = Math.random()*1000;
      myY = Math.random()*1000;
    }
  }
}
