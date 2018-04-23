import processing.video.*;
//file name for video
String vidName = "Ready-Player-One.mp4";
Movie m;
//variable to play speed to make it dynamic
float playSpeed = 1.0;
String arrow = "-->";
String tokens = ":,";
String[] lines;
boolean paused = true, reverse = true;

void setup() {
  size(640, 360);
  frameRate(30);
  m = new Movie(this, vidName);
  m.play();
  m.loop();
}

void draw() {
  background(0);
  image(m, 0, 0);
  text(playSpeed, 600, 330);
}

void movieEvent(Movie m) {
  m.read();
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (playSpeed < 2.0 && playSpeed > .01) {
    if (e == 1.0) {
      playSpeed -= .01;
      m.speed(playSpeed);
    }
  
    if (e == -1.0) {
      playSpeed += .01;
      m.speed(playSpeed);
    }
  }
  }

void keyReleased() {
  //toggles reverse playback
  if (key == 'r') {
    if (reverse) {
      reverse = false;
      m.speed(-1);
    } else {
      reverse = true;
      m.speed(1);
    }
  }
  //toggle pause
  if (key == ' ') {
    if (paused) {
      paused = false;
      m.pause();
    } else {
      m.play(); 
      paused = true;
    }
  }
}