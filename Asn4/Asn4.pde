import processing.video.*;
//file name for video
String vidName = "Ready-Player-One.mp4";
Movie m;
//variable to play speed to make it dynamic
float playSpeed = 1.0;
boolean paused = false;

void setup() {
  size(640, 360);
  frameRate(30);
  m = new Movie(this, vidName);
  m.play();
}

void draw() {
  image(m, 0, 0);
}

void movieEvent(Movie m) {
 m.read(); 
}