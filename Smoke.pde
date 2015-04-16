class Smoke extends Particle {
  //PVector loc;
  //PVector vel;
  //float lifespan;
  //PImage img;
  PImage smokeImg = loadImage("texture.png");

  Smoke(PVector p) {
    float y = -2;
    velocity = new PVector(0, y);
    position = p.get();
    ttl = 100.0;
    //img = img_;
  }

  // Method to update location
  public boolean update() {
    position.add(velocity);
    ttl -= 2.5;
    if (ttl <= 0) return false;
    else return true;
  }

  // Method to display
  void display() {
    tint(255, ttl);
    image(smokeImg, position.x+50, position.y, 50, 50);
    noTint();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (ttl <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

