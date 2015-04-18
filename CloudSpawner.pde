class CloudSpawner extends Spawner<Cloud>
{

  public CloudSpawner()
  {
    children = new ArrayList<Cloud>();
    tts = 50;
  }

  public void draw()
  {
    update();
    display();
  }
    
  public void update()
  {
    
    // for each cloud in cloudspawner c.update();
    ArrayList<Cloud> garbage = new ArrayList<Cloud>();
    for (Cloud c : children) {
      if (!(c.update())) { //updates garbage
        garbage.add(c);
      }
    }
    for (Cloud g : garbage) {  //remove items from garbage
      children.remove(g);
    }
    
    tts--;
    if (tts <= 0) {//spawn new clouds
      PVector newPos = new PVector(random(0, width), random(0, height/2), 0); //random spawn locations
      Cloud newCloud  = new Cloud(newPos);
      spawn(newCloud);
      tts = 50;
    }
  }
  
  public void display()
  {
    for (Cloud c : children) {
      c.display();
    }
  }
}

