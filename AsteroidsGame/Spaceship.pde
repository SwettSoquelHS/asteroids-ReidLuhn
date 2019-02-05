  /*
  Spaceship class
    Should extend Mover class and implement show.
    You may add additional methods to this class, for example "rotate" and "accelerate" 
    might be useful.
*/
class Spaceship extends Mover{  
  ArrayList clip = new ArrayList();
  int wait;
  
  public Spaceship(float x, float y, float speed, float direction, float size){
    super(x, y, speed, direction, size);
    radius = 27.0;
    wait = 0;
  }
  
  void show(){
    pushMatrix();
    translate(x, y);
    rotate(radians(direction + 90));
    fill(#464748);
    ellipse(0, 0, -20, 20);
    beginShape();
    vertex(-2.5, 10);
    vertex(-2.5, 12.5);
    vertex(-7.5, 17.5);
    vertex(-7.5, 12.5);
    vertex(-10, 10);
    vertex(-12.5, 12.5);
    vertex(-12.5, 27.5);
    vertex(-10, 20);
    vertex(-7.5, 27.5);
    vertex(-7.5, 20);
    vertex(-2.5, 17.5);
    vertex(0, 20);
    vertex(2.5, 17.5);
    vertex(7.5, 20);
    vertex(7.5, 27.5);
    vertex(10, 20);
    vertex(12.5, 27.5);
    vertex(12.5, 12.5);
    vertex(10, 10);
    vertex(7.5, 12.5);
    vertex(7.5, 17.5);
    vertex(2.5, 12.5);
    vertex(2.5, 10);
    vertex(-2.5, 10);
    endShape();
    fill(#5DC7FF);
    beginShape();
    vertex(-12.5, 23);
    vertex(-10, 20);
    vertex(-7.5, 23);
    vertex(-12.5, 23);
    endShape();
    beginShape();
    vertex(7.5, 23);
    vertex(10, 20);
    vertex(12.5, 23);
    vertex(7.5, 23);
    endShape();
    popMatrix();
  }
  
  void hyperSpace(){
    x = (float)Math.random() * 640;
    y = (float)Math.random() * 400;
  }
  
   void update() {
    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
    wait--;
  }
  
  void fire(){
    if (wait < 0){
      Bullet b = new Bullet(player1.getX(), player1.getY(), 5.0, player1.getDirection(), 0);
      clip.add(b);
      wait = 14;
    }
  }
  
  public boolean hasHitTarget(Asteroid a, Bullet bullet){
    Bullet b = (Bullet)bullet;
    Asteroid rock = (Asteroid)a;
    if(rock.collidingWith(b)){
       return true;
     }
     return false;
  }
  
}
