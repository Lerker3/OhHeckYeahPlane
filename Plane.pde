class Plane extends Particle {
  //PVector location, velocity, acceleration;
  Banner banner;
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
  }

  public PVector getPos()
  {
    return position;
  }
  
  void draw() {
    update();
    display();
  }

  void update() {
    //Move the plane
    if (position.x < -210) { //MAGIC NUMBER, NEEDS TO BE END OF SCREEN
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

  }

  void display() {

    banner.display();

    pushMatrix();
    translate(position.x, position.y);
    fill(255, 200, 200);
    image(plane, 0, 0, 100, 80);
    popMatrix();
    //for (int i=0; i < smokeArray.size (); i++) {
    //  smokeArray.get(i).display();
    //}
  }
}

