//BUTTON
class Button{
  private float btnX, btnY;
  private float btnWidth, btnHeight;
  private color btnDefaultColor, btnPressedColor;
  private boolean prevMousePressed, isPressed;
  
  public Button(float btnX, float btnY, float btnWidth, float btnHeight, color btnDefaultColor, color btnPressedColor){
    this.btnX = btnX;
    this.btnY = btnY;
    this.btnWidth = btnWidth;
    this.btnHeight = btnHeight;
    this.btnDefaultColor = btnDefaultColor;
    this.btnPressedColor = btnPressedColor;
  }
  
  public void Display(){
    if (isPressed){
      fill(btnDefaultColor,btnPressedColor,0);
      fill(0,255);
    }
    else{
      fill(0,255);
    }
    stroke(#292271);
    strokeWeight(12);
    rect(btnX - btnWidth/2, btnY - btnHeight/2, btnWidth, btnHeight,25);
  }
  
  public boolean IsPressed(){
    boolean btnArea = mouseX >= btnX - btnWidth / 2 && mouseX <= btnX + btnWidth / 2 && mouseY >= btnY - btnHeight / 2 && mouseY <= btnY + btnHeight / 2;
    
    if (btnArea && mousePressed && !isPressed && !prevMousePressed){
      isPressed = true;
    }
    else if (!mousePressed){
      isPressed = false;
    }
    
    if (btnArea && mousePressed && !prevMousePressed){
      prevMousePressed = true;
      return true;
    }
    else{
      prevMousePressed = mousePressed;
      return false;
    }
  }
}