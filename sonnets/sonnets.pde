import java.util.*;

String delimiters = " ,/?<>;:'\"[{}].\\=+-_()*&^%$#@!~";
String inputFile = "sonnets.txt";
ArrayList<Word> myWords;
void setup() {
  size(800, 800);
  background(255);
  noLoop();
  String[] contents = loadStrings(inputFile);
  String raw = join(contents, " ");
  raw = raw.toLowerCase();
  String[] tokens = splitTokens(raw, delimiters);
  myWords = new ArrayList<Word>();

  String [] stopWords = loadStrings("stopwords.txt");
  ArrayList<String> myStopWords = new ArrayList(Arrays.asList(stopWords));

  boolean found;
  boolean isStopWord = false;
  for (int i = 0; i < tokens.length; i++ ) {
    found = false;

    if (!myStopWords.contains(tokens[i])) {  
      for (Word w : myWords) {
        if (w.getWord().equals(tokens[i])) {
          w.incr();
          found = true;
        }
      }
      if (!found && !isStopWord) {
        myWords.add(new Word(tokens[i]));
      }
    }
  }

  Collections.sort(myWords, Collections.reverseOrder());
  println("There are " + myWords.size() +" unique words in " + inputFile);
  print(myWords.toString());
  
}

void draw() {
  float wid = 0; 
  float hit = 0;
  for (int i = 0; i < 50; i++ ){
    String toDraw = myWords.get(i).getWord();
    int si = myWords.get(i).getFreq();
    textSize(si);
    fill(255, 0, 0);
    text(toDraw, wid, hit);
    hit += si;
  }  
}

