//ASN4 video player with subtitles
//use r to toggle reverse
//use spacebar to toggle pause
//use mousewheel to increase or decrease the play speed.
//Possible error, when scrolling up or down when you get to the threshold of 2 and .01
//it will go over by .01 and the playspeed.



import processing.video.*;
//file name for video
String vidName = "Ready-Player-One.mp4";
String subName = "Ready-Player-One-Trailer-HD-English-French-Subtitles.srt";
Movie m;
SubtitlePlayer s;
//variable to play speed to make it dynamic
float playSpeed = 1.0;
boolean paused = true, reverse = true, reverseSubs = false;


void setup() {
  size(640, 360);
  frameRate(30);
  m = new Movie(this, vidName);  
  s = new SubtitlePlayer(subName);
  m.play();
  m.loop();
}

void draw() {
  float currentTime = m.time() * 1000;
  background(0);
  image(m, 0, 0);
  text(playSpeed, 570, 360);
  String Subtitle = s.getSubs(currentTime);
  textSize(15);
  text(Subtitle, 30, 300);
}

void movieEvent(Movie m) {
  m.read();
}




void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (playSpeed < 2.01 && playSpeed > .00) {
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
      reverseSubs = true;
      m.speed(-1);
    } else {
      reverse = true;
      reverseSubs = false;
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
