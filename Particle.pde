protected class Particle {

  protected PVector position;
  protected PVector velocity;
  protected PVector acceleration;
  protected float ttl; // time to live

  /*
  protected float transparency;
   protected float size;
   color Color;
   */

  Particle() {
    position = new PVector(0, 0, 0);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);

    ttl = 100;
  } // end Particle()

  Particle(PVector p, PVector v, PVector a) {
    position.set(p);
    velocity.set(v);
    acceleration.set(a);
    ttl = 100; // set in each particle's individual class
  } // end Particle()

  public void move() {
    // A' = A_g + V*R_air + A
    PVector tempAcceleration = PVector.mult(velocity, AIR_SCALAR);
    tempAcceleration.add(GRAVITY);
    tempAcceleration.add(acceleration); // base acceleration + environment
    velocity.add(tempAcceleration);
    position.add(velocity);
  } // end Particle::move()
}

