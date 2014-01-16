// PADDLE

public class Paddle {
  
  Rectangle rectangle;
  // PADDLE PROPERTIES --
  int width = 300;
  int height = 5;
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;
  //
  int x = gameFrameWidth/2;
  int y = 180;
  //
  //
  int frameCount = 0;
  
  Paddle() {
    rectangle = new Rectangle(width, height, hasStroke, strokeColor, hasFill, fillColor);
    rectangle.setPosition(x, y);
  }
  
  
  
  void refresh(){
    frameCount++;
    if (frameCount % 10 == 0 && width >0)
      width -= 1;
    rectangle = new Rectangle(width, height, hasStroke, strokeColor, hasFill, fillColor);
    updatePosition();
    rectangle.setPosition(x, y);
    rectangle.drawYourself();
  }
  
  
 
  void updatePosition() {
    x = mouseX-recX-width/2;
    x = constrain(x, 0, gameFrameWidth-width);
  }

}

