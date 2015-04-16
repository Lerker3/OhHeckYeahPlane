protected class Spawner<T> {
  // Fields
  protected PVector PMax; // Max Position
  protected PVector PMin; // Min Position
  protected PVector VMax; // Max Velocity
  protected PVector VMin; // Min Velocity
  protected PVector AMax; // Max Acceleration
  protected PVector AMin; // Min Acceleration
  protected ArrayList<T> children;  // children spawned by Spawner

  protected int tts;

  public Spawner() {
    PMin = new PVector(0, 0, 0);
    VMin = new PVector(-50, -50, -50);
    AMin = new PVector(-10, -10, -10);

    PMax = new PVector(0, 0, 0);
    VMax = new PVector(50, 50, 50);
    AMax = new PVector(10, 10, 10);

    children = new ArrayList<T>();
  }

  public void spawn(T child) {
    children.add(child);
  } //end SPawner::spawn()
}

