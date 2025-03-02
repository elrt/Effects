
import processing.sound.*;
import processing.opengl.*;
import android.content.Context;
import android.os.Vibrator;

SoundFile sound;
SoundFile click;
Button menu;
Button waveEffect;
Button back;
Button fireworkEffect;
Button devs;
Button circNetw;
Button spark;
Button settings;
Button vibrating;
Button Sound;
boolean vibrate;
ArrayList<Spark> sparks;
boolean isPlaying = false;
PFont mfont;
PImage Plogo;
PImage settingIcon;
PImage Vlogo;
PImage Slogo;
PImage zapret;
float angle = 0;
int maxRings = 20;
int transparent = 255;
ArrayList<Ring> rings = new ArrayList<Ring>();
boolean mousePressedFlag = false;
boolean mouseReleasedFlag = true;
boolean mouseFlag = true;
boolean mouseFlag2 = true;
boolean songs=false;
int numCircles = 50;
float maxDistance = 200;
Circle[] circles = new Circle[numCircles];

ArrayList<Firework> fireworks;
int scenes=0; //0menu1effectlist2,3...effects
void setup() {
  size(displayWidth, displayHeight, OPENGL);
  menu = new Button(width/2, height/2, width/2, height/20, 0, 0);
  devs = new Button(width/2, height/1.7, width/2, height/20, 0, 0);
  waveEffect = new Button(width/3, height/10, width/2.5, height/20, 200, 150);
  fireworkEffect = new Button(width/3, height/6, width/2.2, height/20, 200, 150);
  circNetw= new Button(width/3, height/4.3, width/2.2, height/20, 200, 150);
  spark = new Button(width/3, height/3.3, width/2.6, height/20, 200, 150);
  back = new Button(width/4, height/1.11, width/3, height/20, 200, 150);
  settings = new Button(width/1.2, height/1.11, width/9, height/19, 200, 150);
  vibrating = new Button(width/10, height/10, width/8, height/18, 200, 150);
  Sound = new Button(width/10, height/6, width/8, height/18, 200, 150);
  sound = new SoundFile(this, "muzik.wav");
  click = new SoundFile(this, "click.wav");
  Plogo = loadImage("Plogo.png");
  Slogo = loadImage("sounD.png");
  zapret = loadImage("zapret.png");
  Vlogo = loadImage("vibrationz.jpg");
  settingIcon = loadImage("settings.jpg");
  mfont = createFont("KiwiSoda.ttf", 150);
  textFont(mfont);


  sparks = new ArrayList<Spark>();
  fireworks = new ArrayList<Firework>();
  frameRate(60);
  imageMode(CENTER);
  smooth(80);
  strokeCap(ROUND);
  for (int i = 0; i < numCircles; i++) {
    circles[i] = new Circle(random(width), random(height));
  }
} 
void draw() {
  if (songs==true) {
      sound.stop();
      isPlaying=false;
    }else{
    if(!isPlaying){
      sound.loop();
      isPlaying = true;
      }
   }
  
  textMode(CENTER);
  if (scenes==6 || scenes==3 || scenes==2 || scenes==5) {
    fill(0, transparent);
    noStroke();
    if (transparent==255) {
      transparent=25;
    }
  } else {
    fill(0);
    transparent=255;
  }
  rect(-50, -50, width+100, height+100);

  textAlign(CENTER);
  textSize(width/8);
  if (scenes==0) {
    pressEffect();
    fill(255);
    text("Project_Effect", width/2, height/3);
    textSize(width/15);
    stroke(0);
    strokeWeight(5);
    menu.Display();
    devs.Display();
    settings.Display();
    image(settingIcon, width/1.2, height/1.11, width/10, height/20);
    fill(255);
    text("Credit", width/2, height/1.66);
    text("To List", width/2, height/1.96);
    if (menu.IsPressed()) {
      scenes=1;
    }
    if (devs.IsPressed()) {

      scenes=4;
    }
    if (settings.IsPressed()) {
      scenes=7;
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
    text("Main developer : elliktronic \n Music by : (downloaded on random site) \n Spark effect: by CalsignLabs", width/2, height/2);
    image(Plogo, width/1.5, height/1.2, width/5, height/10);
    if (back.IsPressed()) {
      scenes=0;
    }
  }
  if (scenes==5) {
    CircleNetworkEff();
  }
  if (scenes==6) {
    SparksEff();
  }
  if (scenes==7) {
    pressEffect();
    Settings();
  }
}
void stop() {
  sound.stop(); // Я НАШЕЛ КАК ПАФИКСИТЬ ������ТА УРАА
  isPlaying=false;
}
