class Player {
  int x;
  int y;
  color col = color(0, 255, 0);
  Player() {
    x = 5;
    y = 15;
  }
  // Displays the player through displayUnit
  void display(Grid map) {
    if(map.map[x][y] == 0){
      col = color(255, 0, 0);
    } else {
      col = color(0, 255, 0);
    }
    map.displayUnit(col, x, y);
    
  }
  // Moves the player. duh.
  void move(int newX, int newY) {
    x += newX;
    y += newY;
  }
}
