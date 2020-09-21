class Log {
  color col;
  int logWidth, y, x;

  Log(int _x, int _y) {
    col = color(#933800);
    logWidth = 3;
    x = _x;
    y = _y;
  }

  void display(Grid map) {
    for (int i = 0; i < logWidth; i++) {
      map.displayUnit(col, x + i, y);
    }
  }
  
  void move(){
      x += 1;
  }
}
