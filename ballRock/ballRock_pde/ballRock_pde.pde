import java.util.Random;
interface Displayable {
  void display();
}
interface Moveable {
  void move();
}
class Thing {
  float x, y;

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

class Rock extends Thing implements Displayable{
  Rock(float x, float y) {
    super(x, y);
  }

  void display() { 
    fill(33, 31, 33);
    rect(x, y, 30, 30);
  }
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x,y);
  }
  void move() {
    Random rng = new Random();
    int incx = rng.nextInt(10) - 5;
    int incy = rng.nextInt(10) - 5;
    if (x > 1000 || y > 800){
      x = 500;
      y = 400;
    }
    x += incx;
    y += incy;
  }
}

class Ball extends Thing implements Displayable, Moveable {
  Ball(float x, float y) {

    super(x, y);
  }

  void display() {
    /* ONE PERSON WRITE THIS */
  }

  void move() {
    /* ONE PERSON WRITE THIS */
  }
}
ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);

  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100),50+random(height)-100);
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    Rock r = new Rock(50+random(width-100),50+random(height)-100);
    thingsToDisplay.add(r);
  }

  LivingRock m = new LivingRock(50+random(width-100),50+random(height)-100);
  thingsToDisplay.add(m);
  thingsToMove.add(m);
}

void draw() {
  background(255);

  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}