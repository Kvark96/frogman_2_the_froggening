class Grid{
  int[][] map;
  int tileSize, tileX, tileY, numOfTiles;

  // Creates a grid with numOfTiles horizontal tiles, and a fitting amount of vertical tiles
  Grid(int screen_width, int screen_height){
    numOfTiles = 11;
    tileSize = screen_width / numOfTiles;
    map = new int[numOfTiles][screen_height / tileSize];
    // Changes value of all fields to 0 (not safe);
    for(int x = 0; x < map.length; x++){
      for(int y = 0; y < map[0].length; y++){
        map[x][y] = 0;
      }
    }
  }
  
  // Draws the grid with blue rectangles
  void display(){
    for(int x = 0; x < map.length; x++){
      for(int y = 0; y < map[0].length; y++){
        fill(0, 0, 255);
        rect(x * tileSize, y*tileSize, tileSize, tileSize);
        map[x][y] = 0;
      }
    }
  }
  
  // Draws a unit on the tilemap with the given color and coordinates.
  void displayUnit(color col, int x, int y){
    fill(col);
    rect(x * tileSize, y * tileSize, tileSize, tileSize);
  }
  
}
