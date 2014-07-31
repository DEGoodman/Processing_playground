class Word implements Comparable<Word>{
  String word;
  int frequency;

  Word(String newWord) {
    word = newWord;
    frequency = 1;
  }

  String getWord() {
    return word;
  }

  int getFreq() {
    return frequency;
  }

  void incr() {
    frequency++;
  }

  String toString() { //print representation of this word and frequency!
    return "[" + word + ", " + frequency + "]";
  }
  
  int compareTo(Word w) {
    return this.frequency - w.frequency;
  }  
}

