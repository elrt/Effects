
void waveEff() {
  noStroke();
  // максимально не приятный цикл
  for (int i = 0; i < 60; i++) {
    for (int j = 0; j < 80; j++) {
     
      float size = 20 + 15 * sin(angle + i * 0.1 + j * 0.1);
      float colorValue = 18 + 17 * sin(angle + i * 0.2 + j * 0.2);
      
     
      fill(colorValue, 100, 255 - colorValue);
      
      
      ellipse(i *30 + 30, j * 30 + 30, size, size);
    }
  }
  
  
  angle += 0.05;
}

void fireworkEff() {
  if (mousePressed) {
    fireworks.add(new Firework(mouseX, mouseY));
  }
  for (int i = fireworks.size() - 1; i >= 0; i--) {
    Firework fw = fireworks.get(i);
    fw.update();
    fw.display();
    
    if (fw.isFinished()) {
      fireworks.remove(i);
    }
  }
  }
  void pressEffect() {
  if (mousePressed && mouseReleasedFlag) {
    click.play();
    Ring ring = new Ring(mouseX, mouseY, 0, random(255), millis());
    rings.add(ring);
    if (rings.size() > maxRings) {
      rings.remove(0);
    }
    mouseReleasedFlag = false;
  } else if (!mousePressed) {
    mouseReleasedFlag = true;
  }
  for (Ring ring : rings) {
    float alpha = map(millis() - ring.time, 0, 200, 255, 0);
    if (alpha > 0) {
      fill(255, alpha);
      noFill();
      strokeWeight(2);
      stroke(255, alpha);
      ellipse(ring.x, ring.y, ring.r, ring.r);
      strokeWeight(0);
      ring.r += 5;
      if (ring.r > 50) ring.r = 0;
    }
    if (millis() - ring.time > 1000) {
      rings.remove(ring);
      break;
    }
    strokeWeight(0);
  }
}
void CircleNetwork() {
    for (Circle circle : circles) {
        circle.move();
        circle.display();
    }
    
    for (int i = 0; i < circles.length; i++) {
        for (int j = i + 1; j < circles.length; j++) {
            float distance = dist(circles[i].x, circles[i].y, circles[j].x, circles[j].y);
            if (distance < maxDistance) {
                stroke(52, 152, 219);
                line(circles[i].x, circles[i].y, circles[j].x, circles[j].y);
            }
        }
    }
}
void sparks(){
  
  for (Spark spark : sparks) {
    spark.update();
    spark.display();
  }
  if(mousePressed){
    if(mouseFlag==false){
    sparks.add(new Spark());
    }
    mouseFlag=true;
  }
  if(!mousePressed){
    mouseFlag=false;
  }
  
}