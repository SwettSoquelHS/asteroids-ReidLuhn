  /*
  Spaceship class
    Should extend Mover class and implement show.
    You may add additional methods to this class, for example "rotate" and "accelerate" 
    might be useful.
*/
class Spaceship extends Mover{  
    
  Spaceship(float x, float y){
    super(x, y);
  }
  
  public Spaceship(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
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
}
