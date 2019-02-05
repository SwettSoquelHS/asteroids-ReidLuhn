import java.util.ArrayList;

/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
Spaceship player1;
ArrayList asteroids = new ArrayList();
Star[] starField = new Star[100];




/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
boolean SPACE_BAR;    //User is pressing space bar
boolean MOVE_BACKWARD; //User is pressing down arrow
int score = 0;
int lives = 5;
int wait;
/* * * * * * * * * * * * * * * * * * * * * * *
 Initialize all of your variables and game state here
 */
public void setup() {
  size(1280, 800);
  ROTATE_LEFT = false;
  ROTATE_RIGHT = false;
  MOVE_FORWARD = false;
  MOVE_BACKWARD = false;
  //initialize your asteroid array and fill it

  for (int i = 0; i < 20; i++) {
    asteroids.add(new Asteroid((float)Math.random() * 1280, (float)Math.random() * 800, (float)((Math.random() * 2.0) + 2), (float)Math.random() * 360.0, 0, random(.8, 1.3)));
    //x, y,
  }
  player1 = new Spaceship((float)width / 2, (float)height / 2, 1.0, 0.0, 0); //x, y, speed, 
  for (int i = 0; i <= 59; i++) {
    starField[i] = new Star((float)Math.random() * 1280, (float)Math.random() * 800);
  }
  wait = 0;

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
  for (int i = 0; i <= 59; i++) {
    starField[i].show();
  }
  
  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment
  for (int i = 0; i < player1.clip.size(); i++) {
    Bullet b = (Bullet)player1.clip.get(i);
    if (b.getX() >= 1280) {
      player1.clip.remove(i);
    }
    if (b.getX() < 0) {
      player1.clip.remove(i);
    }
    if (b.getY() > 800) {
      player1.clip.remove(i);
    }
    if (b.getY() < 0) {
      player1.clip.remove(i);
    }
  }
  for (Object b : player1.clip) {
      Bullet bullet = (Bullet) b;
      bullet.show();
      bullet.update();
  }
  
  //TODO: Part II, Update each of the Asteroids internals
    //checkOnAsteroids();
    
    if(lives <= 0){
      fill(0);
      rect(0, 0, width, height);
      fill(#F00707);
      textSize(25.0);
      text("Game Over", width / 2, height / 2);
      noLoop();
    }

    //Check for asteroid collisions against other asteroids and alter course
    //TODO: Part III, for now keep this comment in place

    //Draw asteroids
    //TODO: Part II

    for (Object b : asteroids) {
      Asteroid rock = (Asteroid)b;
      if (rock.getX() >= 1280) {
        rock.setX(0);
      }
      if (rock.getX() < 0) {
        rock.setX(1280);
      }
      if (rock.getY() > 800) {
        rock.setY(0);
      }
      if (rock.getY() < 0) {
        rock.setY(800);
      }
      rock.update();
      rock.show();
    }
    checkOnAsteroids();
    checkBullets();
    shipHit();
    fill(#F00707);
    textSize(25.0);
    text("Lives: " + lives, 75, 75);
    text("Score: " + score, 1100, 75);
    
    //Update spaceship
    //TODO: Part I
    if (ROTATE_LEFT) {
      player1.setDirection(player1.direction - 5.0);
    }
    if (ROTATE_RIGHT) {
      player1.setDirection(player1.direction + 5.0);
    }

    if (MOVE_FORWARD) {
      if (player1.getSpeed() < 3) {
        player1.setSpeed(player1.speed + 0.3);
      }
    } else {
      if (player1.getSpeed() > 0) {
        player1.setSpeed(player1.speed - 0.1);
      }
      if (player1.getSpeed() < 0) {
        player1.setSpeed(0);
      }
    }


    if (MOVE_BACKWARD == true) {
      player1.setSpeed(player1.speed - 1.5);
    }
    player1.update();
    player1.show();

    if (player1.getX() >= 1280) {
      player1.setX(0);
    }
    if (player1.getX() < 0) {
      player1.setX(1280);
    }
    if (player1.getY() > 800) {
      player1.setY(0);
    }
    if (player1.getY() < 0) {
      player1.setY(800);
    }

    //Check for ship collision agaist asteroids
    //TODO: Part II or III

    //Draw spaceship & and its bullets
    //TODO: Part I, for now just render ship
    //TODO: Part IV - we will use a new feature in Java called an ArrayList, 
    //so for now we'll just leave this comment and come back to it in a bit. 

    if (SPACE_BAR) {
      player1.fire();
    }
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
      } else if (keyCode == DOWN) {
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
      } else if (keyCode == DOWN) {
        MOVE_BACKWARD = false;
      }
    }
    if (keyCode == 32) {
      SPACE_BAR = false;
    }
  }


  void checkBullets() {
    for (int i = 0; i < asteroids.size(); i++) {
      Asteroid a = (Asteroid)asteroids.get(i);
      for (int j = 0; j < player1.clip.size(); j++) {
        Bullet b = (Bullet)player1.clip.get(j);
        if (player1.hasHitTarget(a, b)) {
          player1.clip.remove(j);
          println(j);
          println(player1.clip.size());
          asteroids.remove(i);
          score += 10;
        }
      }
    }
  }
  
  void checkOnAsteroids() {
      for (Object o : asteroids) {
        Asteroid rock1 = (Asteroid)o;
        for (Object z : asteroids) {
          Asteroid rock2 = (Asteroid)z;
          if (rock1 != rock2 && rock1.collidingWith(rock2) && rock1.wait < 0 && rock2.wait < 0) {
            rock1.setDirection(rock1.getDirection() + 180);
            rock1.wait = 15;
            rock2.wait = 15;
          }
        }
      }
  }
  
  
  void shipHit(){
    for (int i = 0; i < asteroids.size(); i++){
      Asteroid a = (Asteroid)asteroids.get(i);
      if(player1.collidingWith(a) && a.wait < 0){
        lives--;
        a.setDirection(a.getDirection() + 180);
        a.wait = 15;
      }
    }
  }
        
