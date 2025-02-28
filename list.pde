void lisT(){
  
  waveEffect.Display();
  fireworkEffect.Display();
  back.Display();
  circNetw.Display();
  textSize(70);textAlign(CENTER);fill(255);text("Back",width/4,height/1.1);
  fill(255);
  textSize(53);
  text("Wave Effect",width/3,height/9.6);
  textSize(53);
  text("Firework Effect",width/3,height/5.8);
  text("Circle Network",width/3,height/4.2);
  if(waveEffect.IsPressed()){
    scenes=2;
  }
  if(fireworkEffect.IsPressed()){
    scenes=3;
  }
  if(back.IsPressed()){
    scenes=0;
  }
  if(circNetw.IsPressed()){
    scenes=5;
  }
}