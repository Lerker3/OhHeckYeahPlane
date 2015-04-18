class Smoke extends Particle {

  PImage smokeImg = loadImage("texture.png");

  Smoke(PVector p) {
    //default smoke properties
    float y = -2;
    velocity = new PVector(0, y);
    position = p.get();
    ttl = 40;
  }

  // Method to update location
  public boolean update() {
    position.add(velocity);
    ttl--;
    if (ttl <= 0) return false;
    else return true;
  }

  // Method to display
  void display() {
    tint(255, 2.5 * (float)ttl);
    image(smokeImg, position.x+50, position.y, 50, 50);
    noTint();
  }
}

