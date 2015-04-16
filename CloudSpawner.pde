class CloudSpawner extends Spawner<Cloud>
{

  public CloudSpawner()
  {
    children = new ArrayList<Cloud>();
    tts = 50;
  }

  public void setup()
  {
  }

  public void draw()
  {
    tts--;
    for (Cloud c : children) {
      c.draw();
    }

    // for each cloud in cloudspawner c.update();
    ArrayList<Cloud> garbage = new ArrayList<Cloud>();
    for (Cloud c : children) {
      if (!(c.update())) { //update
        garbage.add(c);
      }
    }
    for (Cloud g : garbage) {
      children.remove(g);
    }

    if (tts <= 0) {
      PVector newPos = new PVector(random(0, width), random(0, height), 0);
      Cloud newCloud  = new Cloud(newPos);
      spawn(newCloud);
      tts = 50;
    }
  }
}

