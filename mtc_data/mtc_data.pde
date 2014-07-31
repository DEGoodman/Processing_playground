BufferedReader reader;
String line;
ArrayList <String> data;

void setup(){
  size(600, 600);
  reader = createReader("milk-tea-coffee.tsv");
  
  try {
    line = reader.readLine();
  } catch (IOException e){
    e.printStackTrace();
    line = null;
  } 
  
  data = new ArrayList<String>();
  
  while (line != null) {
    String[] pieces = split(line, " ");
    println(pieces);
    println(pieces[2]);
    data.add(pieces[2]);
  }  
}

void draw() {
  
}  
