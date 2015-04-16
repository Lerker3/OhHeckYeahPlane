class Cloud extends Particle
{
  PImage img = loadImage("cloud.png");
  float CLOUD_TTL = 500;

  public Cloud(PVector p)
  {
    float y = -2;
    velocity = new PVector(.2, y);
    acceleration = new PVector(0, 0, 0);
    position = p.get();
    ttl = CLOUD_TTL;
  }

  public void draw()
  {
    update();
    display();
  }

  public boolean update()
  {
    ttl--;
    if (velocity.y <= -2) {
      acceleration.y = .1;
    } else if (velocity.y>2) {
      acceleration.y = -.1;
    }
    velocity.add(acceleration);
    position.add(velocity);
    if (ttl <= 0) return false;
    else return true;
  }

  public void display()
  {
    tint(255, ttl);
    image(img, position.x, position.y, 50, 50);  
    noTint();
  }
}

