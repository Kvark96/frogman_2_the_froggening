class Player {
  int x;
  int y;
  Player() {
    x = 5;
    y = 15;
  }
  // Displays the player through displayUnit
  void display(Grid map) {
    map.displayUnit(color(0, 255, 0), x, y);
  }
  // Moves the player. duh.
  void move(int newX, int newY) {
    x += newX;
    y += newY;
  }
}
