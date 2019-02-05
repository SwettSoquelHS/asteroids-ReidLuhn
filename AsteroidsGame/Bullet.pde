class Bullet extends Mover{

  
   public Bullet(float x, float y, float speed, float direction, float size){
     super(x, y, speed, direction, size);
     radius = 8.0;
   }
   
   
   void show(){
    pushMatrix();
    translate(x, y);
    rotate(radians(direction + 90));
    fill(#F70505);
    beginShape();
    vertex(2.0, 0.0);
    vertex(2.0, 10.0);
    vertex(-2.0, 10.0);
    vertex(-2.0, 0.0);
    vertex(-2.0, 2.0);
    endShape();
    popMatrix();
   }
   
   void update(){
    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
  }


}
