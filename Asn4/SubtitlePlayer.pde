class SubtitlePlayer {
  String arrow = "-->";  //Arrow separating start time from end time
  String tokens = ":,";
  String[] lines;
  IntList Stime = new IntList();
  IntList Etime = new IntList();
  StringList Subtitles = new StringList();
  int currentSub = 0;

  SubtitlePlayer(String fname) {
    //Load the file into the lines array
    lines = loadStrings(fname);
    int i = 0;
    while (i < lines.length) {
      StringList subtitle = new StringList();
      //If the line contains an arrow, you have a new subtitle - get it into a StringList
      if (lines[i].contains(arrow)) {
        subtitle.append(lines[i++]);
        //while the line is not blank
        while (lines[i].length()>0) {
          //append line to subtitle
          subtitle.append(lines[i++]);
        }
        printSubtitle(subtitle);
        println(); //blank line to seperate subtitles
      }
      i++;  //Skip line
    }
  }
  int parseTime(String[] timeArr) {
    //Returns time in ms; time array has format hours, minutes, seconds, milliseconds
    int t = 0;  //Replace this with time calculation
    int hr = parseInt(timeArr[0].trim()) * 60 *60*1000; //hrs conversion 
    int min = parseInt(timeArr[1].trim()) * 60 * 1000;
    int sec = parseInt(timeArr[2].trim()) * 1000;
    int ms = parseInt(timeArr[3].trim());
    t = hr+min+sec+ms;
    return t;
  }
  void printSubtitle(StringList subtitle) {
    //Get the time line - the first element in subtitle
    String timeLine = subtitle.get(0);
    //Find the position of the arrow (-1 if not found - but it should be there)
    int arrowPos = timeLine.indexOf(arrow);
    //Get the string to the left of the arrow - that's the start time
    String t1Str = timeLine.substring(0, arrowPos);
    t1Str = t1Str.trim();
    //Get the string to the right of the arrow - that's the end time
    String t2Str = timeLine.substring(arrowPos + arrow .length() + 1);
    t2Str = t2Str.trim();
    //Split the start time on tokens, creating an array of strings
    String[] startTimeArr = splitTokens(t1Str, tokens);
    //Split the end time on tokens, creating another array of strings
    String[] endTimeArr = splitTokens(t2Str, tokens);
    //println(t1Str);
    //printArray(startTimeArr);
    //println(t2Str);
    //printArray(endTimeArr);
    int t1 = parseTime(startTimeArr);  //Start time
    int t2 = parseTime(endTimeArr);    //End time
    Stime.append(t1);
    Etime.append(t2);
    String sub = "";
    println("Start time:", t1, "End time", t2);
    //Print the text lines in the subtitle StringList
    for (int i = 1; i < subtitle.size(); i++) {
      sub += " " + subtitle.get(i);
    }
    Subtitles.append(sub);
  }


  String getSubs(float currentTime) {
    //check start and end, if between from the arrays display subtitle
    if (currentTime > Stime.get(currentSub) && currentTime < Etime.get(currentSub)) {
      return Subtitles.get(currentSub);
    } else if (currentTime >= Stime.get(currentSub + 1) && currentSub < Subtitles.size()) {
      currentSub++;
    }
    return "";
  }
}
