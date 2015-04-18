class SmokeSpawner extends Spawner<Smoke>
{
  
   public SmokeSpawner()
  {
    children = new ArrayList<Smoke>();
    tts = 5;
  }

  public void draw(PVector p)
  {
    update(p);
    display();
  } 
    
  public void update(PVector p){
    
    // for each smoke in smokespawner s.update();
    ArrayList<Smoke> garbage = new ArrayList<Smoke>();
    for (Smoke s : children) {
      if (!(s.update())) { //update
        garbage.add(s);
      }
    }
    for (Smoke g : garbage) {
      children.remove(g);
    }

    //Every 5 frames puff out some smoke
    tts--;
    if (tts <= 0) {
      Smoke newSmoke = new Smoke(p);
      spawn(newSmoke);
      tts = 5;
    }

  }
  
  public void display(){
  
    for (Smoke s : children) {
      s.display();
    }
    
  }
  
  
  
  
}
