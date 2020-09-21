Grid grid;
Player frogman;
Log log1;
int timer;

void setup() {
  size(600, 900);
  grid = new Grid(width, height);
  frogman = new Player();
  log1 = new Log(4, 5);
  timer = 0;
}

void draw() {
  // Draws the grid with blue rectangles
  grid.display();
  // Draws safezones on top and bottom
  for (int i = 0; i < 11; i++) {
    grid.displayUnit(color(#7E7D7C), i, 15);
    grid.displayUnit(color(#7E7D7C), i, 0);
  }
  // Draws frogman
  frogman.display(grid);
  // Draws log
  log1.display(grid);
  timer++;
  if (timer % 120 == 0) {
    log1.move();
  }
}

// Checks wasd for keyRelease, moving the player in the given direction once pr release
// Also clamps position within the grid, defaulting movement to none.
void keyReleased() {
  switch(key) {
  case 'w':
    if (frogman.y == 0) {
      frogman.move(0, 0);
    } else {
      frogman.move(0, -1);
    }
    break;
  case 'a':
    if (frogman.x == 0) {
      frogman.move(0, 0);
    } else {
      frogman.move(-1, 0);
    }
    break;
  case 's':
    if (frogman.y == 15) {
      frogman.move(0, 0);
    } else {
      frogman.move(0, 1);
    }
    break;
  case 'd':
    if (frogman.x == 10) {
      frogman.move(0, 0);
    } else {
      frogman.move(1, 0);
    }
    break;
  default:
    frogman.move(0, 0);
    break;
  }
}
