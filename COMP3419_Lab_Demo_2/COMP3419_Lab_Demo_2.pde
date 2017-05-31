ArrayList<int[]> dragonballs = new ArrayList<int[]>();
int rear = -400;
int radius = 30;


void setup() {
  size(1000, 800, P3D);
}


void drawBox() {
  pushMatrix();
  background(0);
  translate(width/2, height/2, rear);
  stroke(255);
  noFill();
  box(1000, 800, 800);
  popMatrix();
}


int[] bounceOffWalls(int[] circle) {
  if (circle[2] <= -800) {
    // hit the back wall, bounce back
    circle[5] *= -1;
  }
  if (circle[0] <= 0) {
    // Hit left wall, bounce left
    circle[0] = 0;
    circle[3] *= -1;
  }
  if (circle[0] >= width) {
    // Hit right wall, bounce left
    circle[0] = width;
    circle[3] *= -1;
  }
  if (circle[1] <= 0) {
    // hit the roof, bounce down
    circle[1] = 0;
    circle[4] *= 1;
  }
  if (circle[1] >= height) {
    // hit the floor, bounce up
    circle[1] = height;
    circle[4] *= -1;
  }
  
  return circle;
}


void addGravity(int i) {
  dragonballs.get(i)[4] += 10; 
}


void handleCollisions(int i) {
  // TODO - change rotation based upon wall collisions . . .
  
  // handle collision between balls
  for (int j = i + 1; j < dragonballs.size(); j++) {
    // distance
    float dis = sqrt(pow(dragonballs.get(i)[0] - dragonballs.get(j)[0], 2) + pow(dragonballs.get(i)[1] - dragonballs.get(j)[1], 2) + pow(dragonballs.get(i)[2] - dragonballs.get(j)[2], 2));
    if (dis <= 60) {
      // collision, update directions
      
      // update x
      if (dragonballs.get(i)[3] * dragonballs.get(j)[3] < 0) {
        // opposite directions, swaps speeds
        int tempSpeed = dragonballs.get(i)[3];
        dragonballs.get(i)[3] = dragonballs.get(j)[3];
        dragonballs.get(j)[3] = tempSpeed;
        if (dragonballs.get(i)[3] < 0) {
          dragonballs.get(i)[0] -= int((60-dis)/2) + 1;
          dragonballs.get(j)[0] += int((60-dis)/2) + 1;
        } else {
          dragonballs.get(i)[0] += int((60-dis)/2) + 1;
          dragonballs.get(j)[0] -= int((60-dis)/2) + 1;
        }
      } else {
        // same direction
        if (dragonballs.get(i)[3] > dragonballs.get(j)[3]) {
          // i hits j
          dragonballs.get(i)[3] -= dragonballs.get(j)[3];
          dragonballs.get(j)[3] += dragonballs.get(i)[3] + dragonballs.get(j)[3];
          if (dragonballs.get(i)[3] < 0) {
            dragonballs.get(j)[0] -= int(60-dis) + 1;
          } else {
            dragonballs.get(j)[0] += int(60-dis) + 1;
          }
        } else {
          // j hits i
          dragonballs.get(j)[3] -= dragonballs.get(i)[3];
          dragonballs.get(i)[3] += dragonballs.get(j)[3] + dragonballs.get(i)[3];
          if (dragonballs.get(j)[3] < 0) {
            dragonballs.get(i)[0] -= int(60-dis) + 1;
          } else {
            dragonballs.get(i)[0] += int(60-dis) + 1;
          }
        }
      }
      
      // update y
      if (dragonballs.get(i)[4] * dragonballs.get(j)[4] < 0) {
        // opposite directions, swaps speeds
        int tempSpeed = dragonballs.get(i)[4];
        dragonballs.get(i)[4] = dragonballs.get(j)[4];
        dragonballs.get(j)[4] = tempSpeed;
        if (dragonballs.get(i)[4] < 0) {
          dragonballs.get(i)[1] -= int((60-dis)/2) + 1;
          dragonballs.get(j)[1] += int((60-dis)/2) + 1;
        } else {
          dragonballs.get(i)[1] += int((60-dis)/2) + 1;
          dragonballs.get(j)[1] -= int((60-dis)/2) + 1;
        }
      } else {
        // same direction
        if (dragonballs.get(i)[4] > dragonballs.get(j)[4]) {
          // i hits j
          dragonballs.get(i)[4] -= dragonballs.get(j)[4];
          dragonballs.get(j)[4] += dragonballs.get(i)[4] + dragonballs.get(j)[3];
          if (dragonballs.get(i)[4] < 0) {
            dragonballs.get(j)[1] -= int(60-dis) + 1;
          } else {
            dragonballs.get(j)[1] += int(60-dis) + 1;
          }
        } else {
          // j hits i
          dragonballs.get(j)[4] -= dragonballs.get(i)[4];
          dragonballs.get(i)[4] += dragonballs.get(j)[4] + dragonballs.get(i)[3];
          if (dragonballs.get(j)[4] < 0) {
            dragonballs.get(i)[1] -= int(60-dis) + 1;
          } else {
            dragonballs.get(i)[1] += int(60-dis) + 1;
          }
        }
      }
      
      // update z
      if (dragonballs.get(i)[5] * dragonballs.get(j)[5] < 0) {
        // opposite directions, swaps speeds
        int tempSpeed = dragonballs.get(i)[4];
        dragonballs.get(i)[5] = dragonballs.get(j)[5];
        dragonballs.get(j)[5] = tempSpeed;
        if (dragonballs.get(i)[5] < 0) {
          dragonballs.get(i)[2] -= int((60-dis)/2) + 1;
          dragonballs.get(j)[2] += int((60-dis)/2) + 1;
        } else {
          dragonballs.get(i)[2] += int((60-dis)/2) + 1;
          dragonballs.get(j)[2] -= int((60-dis)/2) + 1;
        }
      } else {
        // same direction
        if (dragonballs.get(i)[5] > dragonballs.get(j)[5]) {
          // i hits j
          dragonballs.get(i)[5] -= dragonballs.get(j)[5];
          dragonballs.get(j)[5] += dragonballs.get(i)[5] + dragonballs.get(j)[3];
          if (dragonballs.get(i)[5] < 0) {
            dragonballs.get(j)[2] -= int(60-dis) + 1;
          } else {
            dragonballs.get(j)[2] += int(60-dis) + 1;
          }
        } else {
          // j hits i
          dragonballs.get(j)[5] -= dragonballs.get(i)[5];
          dragonballs.get(i)[5] += dragonballs.get(j)[5] + dragonballs.get(i)[3];
          if (dragonballs.get(j)[5] < 0) {
            dragonballs.get(i)[2] -= int(60-dis) + 1;
          } else {
            dragonballs.get(i)[2] += int(60-dis) + 1;
          }
        }
      }
    }
  }
}


void energy_decay() {
 for (int i = 0; i < dragonballs.size(); i++) {
   dragonballs.get(i)[6] += 1;
   if (dragonballs.get(i)[6] % 100 == 0) {
     if (dragonballs.get(i)[3] == 0) {
       dragonballs.get(i)[3] = 0;
     } else if (dragonballs.get(i)[3] > 0) {
       dragonballs.get(i)[3] = dragonballs.get(i)[3] - 1;
     } else {
       dragonballs.get(i)[3] = dragonballs.get(i)[3] + 1;
     }
     if (dragonballs.get(i)[4] == 0) {
       dragonballs.get(i)[4] = 0;
     } else if (dragonballs.get(i)[4] > 0) {
       dragonballs.get(i)[4] = dragonballs.get(i)[4] - 1;
     } else {
       dragonballs.get(i)[4] = dragonballs.get(i)[4] + 1;
     }
     if (dragonballs.get(i)[5] == -1) {
       dragonballs.get(i)[5] = -1;
     } else if (dragonballs.get(i)[5] == 1) {
       dragonballs.get(i)[5] = 1;
     } else if (dragonballs.get(i)[5] > 0) {
       dragonballs.get(i)[5] = dragonballs.get(i)[5] - 1;
     } else {
       dragonballs.get(i)[5] = dragonballs.get(i)[5] + 1;
     }
   }
 }
}


void draw() { 
  drawBox();
  lights();
  
  // Decay energy
  energy_decay();
  
  for (int i = 0; i < dragonballs.size(); i++) {
    if (dragonballs.get(i)[2] >= 0) {
      // bounced out of the box, delete ball
      dragonballs.remove(i);
      i--;
    } else {
      pushMatrix();
      noStroke();
      
      // handle wall collisons
      dragonballs.set(i, bounceOffWalls(dragonballs.get(i)));
      
      // Adds gravity
      addGravity(i);
      
      translate(dragonballs.get(i)[0], dragonballs.get(i)[1], dragonballs.get(i)[2]);
      
      PShape sphere = createShape(SPHERE, radius);
      PImage img = loadImage("img/" + dragonballs.get(i)[11] + "star.png");
      sphere.setTexture(img);
      
      // Add rotation
      // TODO -- finish rotation based upon wall collisions + add primary rotation speed and secondary rotation speeds
      if (dragonballs.get(i)[10] == 0) {
        // rotate on x-axis e.g. forwards or backwards
        sphere.rotateY(radians(dragonballs.get(i)[8]));
        sphere.rotateZ(radians(dragonballs.get(i)[9]));
        if (dragonballs.get(i)[3] != 0 || dragonballs.get(i)[4] != 0 || dragonballs.get(i)[5] != 0) {
          if (dragonballs.get(i)[5] > 0) {
            dragonballs.get(i)[7] = (dragonballs.get(i)[7] - 2) % 360;
          } else {
            dragonballs.get(i)[7] = (dragonballs.get(i)[7] + 2) % 360;
          }
          sphere.rotateX(radians(dragonballs.get(i)[7]));
        }
      } else if (dragonballs.get(i)[10] == 1) {
        // rotate on z-axis e.g. side to side
        sphere.rotateX(radians(dragonballs.get(i)[7]));
        sphere.rotateY(radians(dragonballs.get(i)[8]));
        // TODO
      } else {
        // rotate on y-axis e.g. around if got hit by ball
        sphere.rotateX(radians(dragonballs.get(i)[7]));
        sphere.rotateZ(radians(dragonballs.get(i)[9]));
        // TODO
      }
      
      shape(sphere);
      
      // update X coordinate
      dragonballs.get(i)[0] += dragonballs.get(i)[3];
      // update Y coordinate
      dragonballs.get(i)[1] += dragonballs.get(i)[4];
      // update Z coordinate
      dragonballs.get(i)[2] += dragonballs.get(i)[5];
      
      popMatrix();
      
      handleCollisions(i);
      
    }
  }
}


void mouseReleased() {
  // Create new dragonball object with random colour
  
  // Error control for zero speeds
  int x = int(random(-25, 25));
  x = x != 0 ? x : 1;
  int y = int(random(-15, 15));
  y = y != 0 ? y : 1;
  int z = int(random(-15, 15));
  z = y != 0 ? z : 1;
  
  // xStart, yStart, zStart, xSpeed, ySpeed, zSpeed, enegeryCounter, xRotate, yRotate, zRotate, rotateDirection, stars
  int[] dragonball = {mouseX, mouseY, -400, x, y, z, 0, 0, 100, 180, 0, int(random(1, 7))};
  dragonballs.add(dragonball);
}