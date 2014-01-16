// Breakout // // 28/02/2007
// Steph Thirion - Game Mod workshop: < http://trsp.net/teaching/gamemod >
// 
// english version :)
// made with Processing 0124 Beta


Rectangle gameFrame;
Brick[] bricks;
Paddle paddle;
Ball[] balls;
//
//
int frameNum = 0;
//
// SCREEN PROPERTIES --
int screenWidth = 400;
int screenHeight = 400;
color backgroundColor = #303030;
boolean backgroundRefreshes = false;
// 
// GAME FRAME PROPERTIES --
int gameFrameWidth = 300;
int gameFrameHeight = 300;
color gameFrameStroke = #FFFFFF;
boolean gameFrameHasStroke = false;
color gameFrameFill = #000000;
int opacityOfRefresh = 255;
boolean gameFrameRefreshes = true;
// 
//
int recX = (screenWidth-gameFrameWidth)/2;
int recY = (screenHeight-gameFrameHeight)/2;
//




// SETUP FUNCTION --
void setup() {
  size(screenWidth,screenHeight,P3D);
  background(backgroundColor);
  frameRate(60);
  //
  // create objects
  gameFrame = new Rectangle(gameFrameWidth, gameFrameHeight, gameFrameHasStroke, gameFrameStroke, true, gameFrameFill);
  gameFrame.opacity = opacityOfRefresh;
  createBricks();
  createBalls();
  paddle = new Paddle();
  //
  refreshScreen();
}





// DRAW FUNCTION --
void draw() {
  refreshScreen();
  //
  //
  //
  saveScreenshots();  
}






void createBalls(){
  // BALL(S) PROPERTIES --
  int numberOfBalls = 1;
  int yBalls = 150;
  //
  balls = new Ball[numberOfBalls];
  for (int i=0; i<numberOfBalls; i++){
    int x = i*20;
    balls[i] = new Ball(x, yBalls);
  }
}





void createBricks(){
  // BRICK GROUP PROPERTIES --
  int numberOfBricks = 140;
  int bricksPerRow = 20;
  int brickWidth = gameFrameWidth/bricksPerRow;
  int brickHeight = 10;
  boolean brickHasStroke = true;
  color brickStroke = #ffffff;
  boolean brickHasFill = true;
  color brickFill = #ff0000;
  int yBricks = 50; 
  color[] rowsColors = {#ff0000, #ff0000, #ff0000, #ff0000, #ff0000, #ff0000};

  //color[] rowsColors = {#ff00ff, #ff0000, #ff9900, #ffff00, #00ff00, #00ffff};
  //
  //
  // CREATE BRICKS --
  bricks = new Brick[numberOfBricks];
  for (int i=0; i<numberOfBricks; i++){
    int rowNum = i/bricksPerRow;
    
    // coords
    int x = brickWidth*i;
    x -= rowNum*bricksPerRow*brickWidth;
    int y = yBricks+i/bricksPerRow*brickHeight;
    // color
    int num = min(rowNum, rowsColors.length-1);
    color rowColor = rowsColors[num];
    // create brick
    
      bricks[i] = new Brick(x, y, brickWidth, brickHeight, brickHasStroke, brickStroke, brickHasFill, rowColor);
    if (rowNum == 0 && !(i == 8 || i == 12))
      bricks[i].die();
    if (rowNum == 1 && (i <= bricksPerRow + 6 || i >= bricksPerRow + 14 || i == bricksPerRow+10))
      bricks[i].die();
    if (rowNum == 2 && (i <= 2*bricksPerRow + 6 || i >= 2*bricksPerRow + 14))
      bricks[i].die();
    if (rowNum == 3 && (i <= 3*bricksPerRow + 6 || i >= 3*bricksPerRow + 14))
      bricks[i].die();
    if (rowNum == 4 && (i <= 4*bricksPerRow + 7 || i >= 4*bricksPerRow + 13))
      bricks[i].die();
    if (rowNum == 5 && (i <= 5*bricksPerRow + 8 || i >= 5*bricksPerRow + 12))
      bricks[i].die();
    if (rowNum == 6 && i!= 6*bricksPerRow + 10)
      bricks[i].die();
  }
}







void refreshScreen() {
  // BACKGROUND
  if(backgroundRefreshes){
    background(backgroundColor);
  }
  // GAME FRAME
  if(gameFrameRefreshes){
    gameFrame.drawYourself();
  }
  // PADDLE
  paddle.refresh();
  //
  // BRICKS
  for (int i=0; i<bricks.length; i++){
    bricks[i].refresh();
  }
  // BALLS
  for (int i=0; i<balls.length; i++){
    balls[i].refresh();
  }
}




// be careful with this function - only change if you know what you're doing
// the hard disk could fill up with images in a few minutes
// 
//
// press the 'G' key to save frames in TGA pictures in 'saved' folder
//
void saveScreenshots(){
   frameNum++;
   if (keyPressed) {
    if (key == 'g' || key == 'G') {
      if(frameNum%2==0){
        saveFrame("saved/frame-####.tga");
      }
    }
  } 
}
      
   

