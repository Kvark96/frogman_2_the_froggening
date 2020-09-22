Grid grid;
Player frogman;
int timer;
Log[] logArr;
Timer logTimer;
int totalLogs;

void setup() {
  size(600, 900);
  grid = new Grid(width, height);
  frogman = new Player();
  timer = 0;

  totalLogs = 0;
  logTimer = new Timer(1000);
  logTimer.start();

  // Creates array of logs
  logArr = new Log[28];
  /*
  for (int i = 0; i < logArr.length; i++) {
   // Every other log will be on the other side, going in the opposite direction
   
   
   logArr[i] = new Log(side, i + 1, dir);
   } */
}

void draw() {
  background(255);
  // Draws the grid with blue rectangles
  grid.display();
  // Draws safezones on top and bottom
  for (int i = 0; i < 11; i++) {
    grid.displayUnit(color(#7E7D7C), i, 15);
    grid.displayUnit(color(#7E7D7C), i, 0);
    // Changes the values of safezones to 1 (safe)
    grid.map[i][15] = 1;
    grid.map[i][0] = 1;
  }

  if (logTimer.isFinished()) {
    createLog();
  }
  displayAll();
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

void displayAll() {
  // Draws logs in logArr
  // Moves logs in logArr
  timer++;
  for (Log log : logArr) {
    if (log != null) {
      log.display(grid);
      if (timer % 60 == 0) {
        log.move();
        frogman.move(log.dir, 0);
        
      }
    }
  }


  // Draws frogman
  frogman.display(grid);
}

void createLog() {
  if (totalLogs == 28) {
    totalLogs = 0;
  }
  if (totalLogs < logArr.length) {
    int side = totalLogs % 2 == 0 ? 0 : 8;
    int logY = 14 - ((totalLogs % 14));
    int dir = totalLogs % 2 == 0 ? 1 : -1;
    logArr[totalLogs] = new Log(side, logY, dir);

    totalLogs ++;
  }
  logTimer.start();
}
