/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
Spaceship player1;
  Asteroid[] asteroids = new Asteroid[10];
  Star[] starField = new Star[60];


/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
boolean SPACE_BAR;    //User is pressing space bar
boolean MOVE_BACKWARD; //User is pressing down arrow
  
/* * * * * * * * * * * * * * * * * * * * * * *
  Initialize all of your variables and game state here
 */
public void setup() {
  size(640, 400);
  ROTATE_LEFT = false;
  ROTATE_RIGHT = false;
  MOVE_FORWARD = false;
  MOVE_BACKWARD = false;
  
  //initialize your asteroid array and fill it
  
  for (int i = 0; i <= 9; i++){
    asteroids[i] = new Asteroid((float)Math.random() * 640, (float)Math.random() * 400, (float)Math.random() * 5, (float)Math.random() * , 0.0);
  }
  
  player1 = new Spaceship((float)width / 2, (float)height / 2, 1.0, 0.0);
  for (int i = 0; i <= 59; i++){
    starField[i] = new Star((float)Math.random() * 640, (float)Math.random() * 400);
  }
  
  //initialize starfield
}


/* * * * * * * * * * * * * * * * * * * * * * *
  Drawing work here
 */
public void draw() {
  //your code here
  fill(0, 25);
  rect(0, 0, width, height);
  
  //Draw Starfield first 
  for (int i = 0; i <= 59; i++){
    starField[i].show();
  }
  
  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals

  //Check for asteroid collisions against other asteroids and alter course
  //TODO: Part III, for now keep this comment in place

  //Draw asteroids
  //TODO: Part II
  
  for (int i = 0; i <= 9; i++){
    asteroids[i].update();
    asteroids[i].show();
    
    if(player1.getX() >= 640){
      player1.setX(0);
    }
    if(player1.getX() < 0){
      player1.setX(640);
    }
    if(player1.getY() > 400){
      player1.setY(0);
    }
    if(player1.getY() < 0){
      player1.setY(400);
    }
  }
  

  //Update spaceship
  //TODO: Part I
  if (ROTATE_LEFT){
    player1.setDirection(player1.direction - 5.0);
  }
  if (ROTATE_RIGHT){
    player1.setDirection(player1.direction + 5.0);
  }
  
  if (MOVE_FORWARD){
    if(player1.getSpeed() < 3){
      player1.setSpeed(player1.speed + 0.3);
    }
  } else {
    if (player1.getSpeed() > 0){
      player1.setSpeed(player1.speed - 0.1);
    }
    if (player1.getSpeed() < 0){
      player1.setSpeed(0);
    }
  }
  
  
  if (MOVE_BACKWARD == true){
    player1.setSpeed(player1.speed - 1.5);
  }
  player1.update();
  player1.show();
  
  if(player1.getX() >= 640){
      player1.setX(0);
    }
    if(player1.getX() < 0){
      player1.setX(640);
    }
    if(player1.getY() > 400){
      player1.setY(0);
    }
    if(player1.getY() < 0){
      player1.setY(400);
    }
  
  //Check for ship collision agaist asteroids
  //TODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part I, for now just render ship
  //TODO: Part IV - we will use a new feature in Java called an ArrayList, 
  //so for now we'll just leave this comment and come back to it in a bit. 
  
  //Update score
  //TODO: Keep track of a score and output the score at the top right
}



/* * * * * * * * * * * * * * * * * * * * * * *
  Record relevent key presses for our game
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      ROTATE_LEFT = true;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = true;
    } else if (keyCode == UP) {
      MOVE_FORWARD = true;
    } else if (keyCode == DOWN){
      MOVE_BACKWARD = true;
    }
  }

  //32 is spacebar
  if (keyCode == 32) {  
    SPACE_BAR = true;
  }
}



/* * * * * * * * * * * * * * * * * * * * * * *
  Record relevant key releases for our game.
 */
void keyReleased() {  
  if (key == CODED) { 
    if (keyCode == LEFT) {
      ROTATE_LEFT = false;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = false;
    } else if (keyCode == UP) {
      MOVE_FORWARD = false;
    } else if (keyCode == DOWN){
      MOVE_BACKWARD = false;
    }
  }
  if (keyCode == 32) {
    SPACE_BAR = false;
  }
}
