
PImage mapImage;
BufferedReader reader;
String line;
float [] xPos;
float [] yPos;
final int DATASIZE = 50;
int ind = 0;

void setup() {
size(640,400);
smooth();
noStroke();
fill(255,0,0);
reader = createReader("locations.tsv");
xPos = new float[DATASIZE];
yPos = new float[DATASIZE];

try {
line = reader.readLine(); 
} catch (IOException e) {
println("I am sorry, the reader blew up and couldn't handle");
line = null;
}

while (line != null) { 
String[] pieces = split(line, TAB);
xPos[ind] = float(pieces[1]);
yPos[ind] = float(pieces[2]);
ind++;

try {
line = reader.readLine(); 
} catch (IOException e) {
println("I am sorry, the reader blew up and couldn't handle");
line = null;
}
}
mapImage = loadImage("map.png");
}

void draw() {
image(mapImage,0,0);

for (int i = 0; i < DATASIZE; i++) {
if ((xPos[i] == mouseX) && (yPos[i] == mouseY)) {
ellipse(xPos[i], yPos[i], 10,10);
} else {
ellipse(xPos[i], yPos[i], 5 ,5); 
}
}
}


