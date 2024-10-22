//character drawing lol
int w = 450;
int s = 650;
//speed n stuff
int x = 500;
int y = 500;
int z = 50;
int speed = 5;
int spread = 5;
//orb
boolean bulletshot = false;
int bulletX, bulletY;
int bulletspeed = 20;

boolean[] targethit = new boolean[30];

void setup() {
  size(900, 700);
  for (int i = 0; i < targethit.length; i++) {
    targethit[i] = false;
  }
}

void draw() {
  //character
  background(0);
  fill(255, 0, 0);
  rect(w, s, 50, 50);

  if (keyPressed && key == 'a') {
    w -= 5;
  }
  if (keyPressed && key == 'd') {
    w += 5;
  }
  if (keyPressed && key == 'A') {
    w -= 7;
  }
  if (keyPressed && key == 'D') {
    w += 7;
  }
  if (x > 900) {
    speed *= -1;
  }
  if (x < 0) {
    speed *= -1;
  }
  if (y > 700) {
    spread *= -1;
  }
  if (y < 0) {
    spread *= -1;
  }


  //orb
  fill (0, 0, 255);
  ellipse(x, y, 35, 35);


  //bullet
  if (bulletshot) {
    fill(255, 255, 0);
    rect(bulletX, bulletY, 10, 20);
    bulletY -= bulletspeed;

    if (dist(bulletX + 5, bulletY + 10, x, y) < 25) {
      speed *= -1;
      spread *= -1;
      bulletshot = false;
    }

    if (bulletY < 0) {
      bulletshot = false;
    }
  }


  x += speed;
  y += spread;

  //targets
  fill(0, 255, 0);
  target(350, 350, 50, 50, 0);
  target(350, 300, 50, 50, 1);
  target(300, 300, 50, 50, 2);
  target(300, 250, 50, 50, 3);

  target(700, 500, 50, 50, 4);
  target(700, 400, 50, 50, 5);
  target(650, 450, 50, 50, 6);
  target(650, 400, 50, 50, 7);
  target(600, 450, 50, 50, 8);

  target(400, 50, 50, 50, 9);
  target(400, 100, 50, 50, 10);
  target(450, 100, 50, 50, 11);
  target(450, 150, 50, 50, 12);
  target(450, 50, 50, 50, 13);

  target(50, 50, 50, 50, 14);
  target(50, 100, 50, 50, 15);
  target(100, 50, 50, 50, 16);
  target(100, 100, 50, 50, 17);

  target(800, 0, 50, 50, 18);
  target(800, 50, 50, 50, 19);
  target(800, 100, 50, 50, 20);
  target(850, 0, 50, 50, 21);

  target(150, 500, 50, 50, 22);
  target(200, 450, 50, 50, 23);
  target(250, 500, 50, 50, 24);
  target(200, 500, 50, 50, 25);
  target(200, 450, 50, 50, 26);

  target(100, 300, 50, 50, 27);
  target(150, 300, 50, 50, 28);
  target(150, 350, 50, 50, 29);
}
//target function
void target(int rectX, int rectY, int rectW, int rectH, int index) {
  if (targethit[index]) {
    fill(200, 162, 200); 
  } else {
    fill(0, 255, 0);
  }

  rect(rectX, rectY, rectW, rectH);


  if (x + 17.5 > rectX && x - 17.5 < rectX + rectW && y + 17.5 > rectY && y - 17.5 < rectY + rectH) {
    direction();
    targethit[index] = true;
  }
}
//orb direction
void direction() {
  speed = (int)random(3, 8) * (random(1) > 0.5 ? 1 : -1);
  spread = (int)random(3, 8) * (random(1) > 0.5 ? 1 : -1);
}

// Shooting bullet
void keyPressed() {
  if (key == 'W' || key == 'w') {
    if (!bulletshot) {
      bulletshot = true;
      bulletX = w + 20;
      bulletY = s;
    }
  }
}
