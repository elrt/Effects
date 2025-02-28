import processing.sound.*;

SoundFile sound;
SoundFile click;
Button menu;
Button waveEffect;
Button back;
Button fireworkEffect;
Button devs;
Button circNetw;
PFont mfont;
PImage Plogo;
float angle = 0;
int maxRings = 20;
ArrayList<Ring> rings = new ArrayList<Ring>();
boolean mousePressedFlag = false;
boolean mouseReleasedFlag = true;
int numCircles = 50;
float maxDistance = 200;
Circle[] circles = new Circle[numCircles];

ArrayList<Firework> fireworks;
int scenes=0; //0menu1effectlist2,3...effects
void setup() {
  size(displayWidth, displayHeight, P2D);
  menu = new Button(width/2, height/2, width/2, height/20, 0, 0);
  devs = new Button(width/2, height/1.7, width/2, height/20, 0, 0);
  waveEffect = new Button(width/3, height/10, width/2.5, height/20, 200, 150);
  fireworkEffect = new Button(width/3, height/6, width/2.2, height/20, 200, 150);
  circNetw= new Button(width/3, height/4.3, width/2.2, height/20, 200, 150);
  back = new Button(width/4, height/1.11, width/3, height/20, 200, 150);
  sound = new SoundFile(this, "muzik.wav");
  click = new SoundFile(this, "click.wav");
  Plogo = loadImage("Plogo.png");
  mfont = createFont("KiwiSoda.ttf", 50);
  textFont(mfont);
  fireworks = new ArrayList<Firework>();
  sound.loop();
  for (int i = 0; i < numCircles; i++) {
    circles[i] = new Circle(random(width), random(height));
  }
} 
void draw() {

  textMode(CENTER);
  background(5, 5, 15);
  textAlign(CENTER);
  textSize(width/15);
  if (scenes==0) {
    pressEffect();
    fill(255);
    text("Project_Effect", width/2, height/3);
    stroke(0);
    strokeWeight(5);
    menu.Display();
    devs.Display();
    fill(255);
    text("Credit", width/2, height/1.66);
    text("To List", width/2, height/1.96);
    if (menu.IsPressed()) {
      scenes=1;
    }
    if (devs.IsPressed()) {

      scenes=4;
    }
  }
  if (scenes==1) {
    pressEffect();
    lisT();
  }
  if (scenes==2) {
    waveEffS();
  }
  if (scenes==3) {
    fireworkEffS();
  }
  if (scenes==4) {
    pressEffect();
    back.Display();
    textSize(70);
    textAlign(CENTER);
    fill(255);
    text("Back", width/4, height/1.1);
    textSize(60);
    text("Main developer : elliktronic \n Music by : example \n", width/2, height/2);
    image(Plogo, width/1.5, height/1.2, width/5, height/10);
    if (back.IsPressed()) {
      scenes=0;
    }
  }
  if (scenes==5) {
    CircleNetworkEff();
  }
}
