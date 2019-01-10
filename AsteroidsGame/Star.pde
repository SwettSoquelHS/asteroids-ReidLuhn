//note that this class does NOT *NEED* to extend Mover but can if you like
class Star {
  //your code here
   float x, y;
   public Star(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void show(){
    pushMatrix();
    translate(x, y);
    fill(255);
    ellipse(0.0, 0.0, 4.0, 4.0);
    popMatrix(); 
  }
}
