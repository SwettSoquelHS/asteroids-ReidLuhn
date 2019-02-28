/*
  Asteroid class
    Should extend Mover class and implement show.
    
    Initially, your asteroid may just be a simple circle or square
    but the final program should use "beginShap(), vertex(), and endShape()"
    to render the asteroid.
*/
class Asteroid extends Mover{   
  //your code here
  float rotation, size;
  boolean hit;
  int wait;
  
  public Asteroid(float x, float y, float speed, float direction, float rotation, float size){
    super(x, y, speed, direction, size);
    radius = 20.0;
    this.size = size;
    rotation = 0;
    wait = 0;
  }
  
  
  
  void show(){
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    fill(90);
    scale(size);
    beginShape();
    vertex(-5.0, 20.0 );
    vertex(5.0, 15.0 );
    vertex(25.0, 15.0 );
    vertex(20.0, 5.0 );
    vertex(15.0 , -10.0 );
    vertex(5.0 , -15.0 );
    vertex(5.0 , -25.0 );
    vertex(-15.0 , -20.0 );
    vertex(-15.0 , 0.0 );
    vertex(-5.0 , 20.0 );
    endShape();
    popMatrix();
  }
  
  void update(){
    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
    rotation += 2;
    wait--;
  } 
}
