class Plane extends Particle {
  //PVector location, velocity, acceleration;
  Banner banner;
  Spawner<Smoke> SmokeSpawner = new Spawner<Smoke>();
  PImage plane;
  //ArrayList<Smoke> smokeArray;
  int globalcount=0;

  public Plane() {
    size(600, 600);
    imageMode(CENTER);
    rectMode(CENTER);
    position = new PVector(width+20, height/2);
    velocity = new PVector(-2, 0);
    acceleration = new PVector(0, .2);
    banner = new Banner(position.x+150, position.y, 115, 20);
    plane = loadImage("plane.jpeg");
    SmokeSpawner.children = new ArrayList<Smoke>();
    SmokeSpawner.tts = 5;
  }

  void draw() {
    update();
    display();
  }

  void update() {
    //Move the plane
    if (position.x < -210) {
      position.x = width + 40;
      position.y = height/2;
    }
    if (velocity.y < -2) {
      acceleration.y = .2;
    } else if (velocity.y>2) {
      acceleration.y = -.2;
    }
    velocity.add(acceleration);
    position.add(velocity);

    //Call banner update function
    banner.update(position);

    // for each smoke in smokespawner s.update();
    ArrayList<Smoke> garbage = new ArrayList<Smoke>();
    for (Smoke s : SmokeSpawner.children) {
      if (!(s.update())) { //update
        garbage.add(s);
      }
    }
    for (Smoke g : garbage) {
      SmokeSpawner.children.remove(g);
    }

    //Every 5 frames puff out some smoke
    SmokeSpawner.tts--;
    if (SmokeSpawner.tts <= 0) {
      Smoke newSmoke = new Smoke(position);
      SmokeSpawner.spawn(newSmoke);
      SmokeSpawner.tts = 5;
    }
  }

  void display() {
    background(255, 255, 255);
    pushMatrix();
    translate(position.x, position.y);
    fill(255, 200, 200);
    image(plane, 0, 0, 100, 80);
    popMatrix();
    //for (int i=0; i < smokeArray.size (); i++) {
    //  smokeArray.get(i).display();
    //}

    for (Smoke s : SmokeSpawner.children) {
      s.display();
    }

    banner.display();
  }
}

