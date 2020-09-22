class Log {
  color col;
  int logWidth, y, x, dir;

  Log(int _x, int _y, int _dir) {
    col = color(#933800);
    logWidth = 3;
    x = _x;
    y = _y;
    dir = _dir;
  }

  void display(Grid map) {
    for (int i = 0; i < logWidth; i++) {
      // Only displayUnit if logtile is within the grid 
      if (x + i < 11 && x + i >= 0) {
        map.displayUnit(col, x + i, y);
        // Change the logtile to the value of 1 (safe)
        map.map[x + i][y] = 1;
      }
    }
  }

  void move() {
    x += dir;
  }
  
  
  String toString(){
    String str = "" + x + ", " + y + ", " + dir;
    return str;
  }
  
  
}
