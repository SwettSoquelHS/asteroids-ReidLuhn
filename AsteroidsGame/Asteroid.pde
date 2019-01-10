/*
  Asteroid class
    Should extend Mover class and implement show.
    
    Initially, your asteroid may just be a simple circle or square
    but the final program should use "beginShap(), vertex(), and endShape()"
    to render the asteroid.
*/
class Asteroid extends Mover {   
  //your code here
  float rotation;
  float[] xCoords = new float[10];
  float[] yCoords = new float[10];
  
  Asteroid(float x, float y){
    super(x, y);
  }
  
  public Asteroid(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
  }
  
  
  
  void show(){
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    fill(200);
    scale(2.0);
    beginShape();
    vertex(5.0, 0.0);
    vertex(0.0, 8.0);
    vertex(-5.0, 0.0);
    vertex(-5.0, 5.0);
    endShape();
    popMatrix();    
  }
  
  void update(){
    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
    rotation += 2;
}
