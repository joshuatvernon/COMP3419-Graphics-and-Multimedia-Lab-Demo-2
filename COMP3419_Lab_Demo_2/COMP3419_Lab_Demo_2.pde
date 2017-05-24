ArrayList<int[]> circles = new ArrayList<int[]>();
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


boolean xCollision(int[] circle) {
  return true;
}

boolean yCollision(int[] circle) {
  return true;
}

boolean zCollision(int[] circle) {
  return true;
}

boolean hasCollided(int[] circle) {
  return xCollision(circle) || yCollision(circle) || zCollision(circle);
}


void draw() {
  drawBox();
  ArrayList<Integer> colors = new ArrayList<Integer>();
  colors.add(color(252, 30, 69));
  colors.add(color(42, 191, 248));
  colors.add(color(255, 253, 56));
  colors.add(color(116, 92, 157));
  colors.add(color(161, 233, 91));
  lights();
  for (int i = 0; i < circles.size(); i++) {
    if (circles.get(i)[2] >= 0) {
      // bounced out of the box, delete ball
      circles.remove(i);
      i--;
    } else {
      pushMatrix();
      noStroke();
      
      // handle wall collisons
      circles.set(i, bounceOffWalls(circles.get(i)));
      
      // Adds gravity
      circles.get(i)[4] += 10;
      
      translate(circles.get(i)[0], circles.get(i)[1], circles.get(i)[2]);
      fill(circles.get(i)[6], circles.get(i)[7], circles.get(i)[8]);
      sphere(radius);
      
      // update X coordinate
      circles.get(i)[0] += circles.get(i)[3];
      // update Y coordinate
      //circles.get(i)[1] += circles.get(i)[4];
      // update Z coordinate
      //circles.get(i)[2] += circles.get(i)[5];
      
      //if (hasCollided(circles.get(i))) {
      //  System.out.print("collision!!");
      //}
      
      popMatrix();
      
      // handle collision between balls
      for (int j = i + 1; j < circles.size(); j++) {
        // distance
        float dis = sqrt(pow(circles.get(i)[0] - circles.get(j)[0], 2) + pow(circles.get(i)[1] - circles.get(j)[1], 2) + pow(circles.get(i)[2] - circles.get(j)[2], 2));
        if (dis <= 60) {
          // collided
          if (circles.get(i)[3] * circles.get(j)[3] < 0) {
            // opposite directions
            circles.get(i)[3] *= -1;
            circles.get(j)[3] *= -1;
          } else {
            // same direction
            if (circles.get(i)[3] > circles.get(j)[3]) {
              // i hits j
              circles.get(i)[3] -= circles.get(j)[3];
              circles.get(j)[3] += circles.get(i)[3] + circles.get(j)[3];
            } else {
              // j hits i
              circles.get(j)[3] -= circles.get(i)[3];
              circles.get(i)[3] += circles.get(j)[3] + circles.get(i)[3];
            }
          }
          
          //int temp_x = circles.get(i)[3];
          //int temp_y = circles.get(i)[4];
          //int temp_z = circles.get(i)[5];
          //circles.get(i)[3] += circles.get(j)[3];
          //circles.get(i)[4] += circles.get(j)[4];
          //circles.get(i)[5] += circles.get(j)[5];
          //circles.get(j)[3] += temp_x;
          //circles.get(j)[4] += temp_y;
          //circles.get(j)[5] += temp_z;
          
        }
      }
    }
  }
}


void mouseReleased() {
  // xStart, yStart, zStart, xSpeed, ySpeed, zSpeed, redVal, greenVal, blueVal
  int[] circle = {mouseX, mouseY, -400, int(random(-15, 15)), int(random(-15, 15)), int(random(-15, 15)), int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), };
  circles.add(circle);
}