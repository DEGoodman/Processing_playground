// File I/O example

BufferedReader reader;
String line;

void setup(){
  size(220, 600);
  noSmooth();
  // open file
  reader = createReader("points_IO.txt");
  fill(255, 50);
  ellipseMode(CENTER);
}

void draw(){
  //background(0);  
  try {
    line = reader.readLine();
  } catch (IOException e){
    e.printStackTrace();
    line = null;
  }  
  
  if(line == null) {
    // stop reading because of an error or file is empty
    noLoop();
  }  else {
    print(line);
    // parse line by 'comma'
    String[] pieces = split(line, ", ");
    int x = int(pieces[0]) * 2;
    int y = int(pieces[1]) * 2;
    println(" -- x: " + x + ", y: " + y);
    ellipse(x, y, 50, 50);
    point(x,y);
  }  
}  
