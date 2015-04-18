class Cloud extends Particle
{
  PImage img = loadImage("cloud.png"); // cloud image
  int CLOUD_TTL = 500; // cloud time to live
  int CLOUD_MAX_VELOCITY = 2;
  float CLOUD_ACCEL_CHANGE = .1;

  public Cloud(PVector p)
  {
    //default cloud properties
    float y = -2;
    velocity = new PVector(.2, y);
    acceleration = new PVector(0, 0, 0);
    position = p.get();
    ttl = CLOUD_TTL;
  }

  public boolean update()
  {
    //decrease time to live by one, clouds will fluctuate between +2 and -2 velocity
    ttl--;
    if (velocity.y <= -1 * CLOUD_MAX_VELOCITY) {
      acceleration.y = CLOUD_ACCEL_CHANGE;
    } else if (velocity.y > CLOUD_MAX_VELOCITY) {
      acceleration.y = -1 * CLOUD_ACCEL_CHANGE;
    }
    velocity.add(acceleration);
    position.add(velocity);
    if (ttl <= 0) return false;
    else return true;
  }

  public void display()
  {
    tint(255, ttl);  //makes clouds become transparent over time
    image(img, position.x, position.y, 50, 50);  
    noTint();
  }
}

