void waveEffS(){
  waveEff();
  
  textSize(70);
  textAlign(CENTER);
  back.Display();
  fill(255);
  text("Back",width/4,height/1.1);
  if(back.IsPressed()){
    scenes=1;
  }
}
void fireworkEffS(){
  fireworkEff();
  noStroke();
  textSize(70);
  textAlign(CENTER);
  back.Display();
  fill(255);
  text("Back",width/4,height/1.1);
  if(back.IsPressed()){
    scenes=1;
  }
}
void CircleNetworkEff(){
  CircleNetwork();
  
  textSize(70);
  textAlign(CENTER);
  back.Display();
  fill(255);
  text("Back",width/4,height/1.1);
  if(back.IsPressed()){
    scenes=1;
  }
}
void SparksEff(){
  sparks();
  
  textSize(70);
  textAlign(CENTER);
  back.Display();
  fill(255);
  text("Back",width/4,height/1.1);
  if(back.IsPressed()){
    scenes=1;
  }
}
