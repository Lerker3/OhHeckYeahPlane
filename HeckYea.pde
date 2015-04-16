Plane air;
PVector GRAVITY = new PVector(0, -0.01, 0); // Acceleration due to Gravity
float AIR_SCALAR = (-0.025); // Acceleration due to Air
CloudSpawner c;


void setup() {
  air = new Plane();
  c = new CloudSpawner();
}

void draw() {
  air.draw();
  c.draw();
}

