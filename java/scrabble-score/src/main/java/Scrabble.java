import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.IntStream;

class Scrabble {

  private static final Map<Character, Integer> SCORE_TABLE;

  static {
    Map<Character, Integer> aMap = new HashMap<>();
    aMap.put('a', 1);
    aMap.put('e', 1);
    aMap.put('i', 1);
    aMap.put('o', 1);
    aMap.put('u', 1);
    aMap.put('l', 1);
    aMap.put('n', 1);
    aMap.put('r', 1);
    aMap.put('s', 1);
    aMap.put('t', 1);
    aMap.put('d', 2);
    aMap.put('g', 2);
    aMap.put('b', 3);
    aMap.put('c', 3);
    aMap.put('m', 3);
    aMap.put('p', 3);
    aMap.put('f', 4);
    aMap.put('h', 4);
    aMap.put('v', 4);
    aMap.put('w', 4);
    aMap.put('y', 4);
    aMap.put('k', 5);
    aMap.put('j', 8);
    aMap.put('x', 8);
    aMap.put('q', 10);
    aMap.put('z', 10);
    SCORE_TABLE = Collections.unmodifiableMap(aMap);
  }

  private IntStream letters;

  Scrabble(String word) {
    letters = word.toLowerCase().chars();
  }

  int getScore() {
    return letters.map(l -> SCORE_TABLE.get((char) l)).sum();
  }
}
