Plane air;
PVector GRAVITY = new PVector(0, -0.01, 0); // Acceleration due to Gravity
float AIR_SCALAR = (-0.025); // Acceleration due to Air
CloudSpawner c;
SmokeSpawner s;

void setup() {
  //create a plane object, plane contains smoke spawner
  air = new Plane();
  //create a cloud spawner for the sky
  c = new CloudSpawner();
  s = new SmokeSpawner();
}

void draw() {
  background(255, 255, 255);
  c.draw();
  air.draw();
  PVector p = air.getPos();
  s.draw(p);
}

