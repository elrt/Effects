void Settings(){
  vibrating.Display();
  Sound.Display();
  textSize(70);
  textAlign(CENTER);
  back.Display();
  fill(255);
  text("Back",width/4,height/1.1);
  image(Vlogo, width/10, height/10, width/8, height/17);
  image(Slogo, width/10, height/6, width/8, height/17);
  if(mouseFlag==false || mouseFlag2==false){
  if(vibrating.IsPressed()){
    
    mouseFlag=true;
    vibrate=!vibrate;
    }
    if(Sound.IsPressed()){
      mouseFlag2=true;
      songs=!songs;
    }
  }
  mouseFlag2=false;
  mouseFlag=false;
  if(vibrate==true){
   image(zapret,width/10,height/10,width/8,height/17); 
  }
  if(songs==true){
   image(zapret,width/10,height/6,width/8,height/17); 
  }
  if(back.IsPressed()){
    scenes=0;
  }
  
}