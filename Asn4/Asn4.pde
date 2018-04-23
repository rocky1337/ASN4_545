import processing.video.*;
//file name for video
String vidName = "Ready-Player-One.mp4";
Movie m;
//variable to play speed to make it dynamic
float playSpeed = 1.0;
boolean paused = true, reverse = true;

void setup() {
  background(0);
  textAlign(BOTTOM);
  text(playSpeed, 50, 50);
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
//changes the speed of the movie mousewheel up increases, down decreases speed
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (playSpeed < 2.0) {
    if (playSpeed > .01) {
      if (e == -1.0) {
        playSpeed += .01;
        m.speed(playSpeed);
        println(playSpeed);
      } else if (e == 1.0) {
        playSpeed -= .01;
        m.speed(playSpeed);
        print(playSpeed);
      }
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
