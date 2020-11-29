import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

class ResistorColor {

  private static final Map<String, Integer> RESISTOR_TABLE;

  static {
    Map<String, Integer> aMap = new HashMap<>();
    aMap.put("black", 0);
    aMap.put("brown", 1);
    aMap.put("red", 2);
    aMap.put("orange", 3);
    aMap.put("yellow", 4);
    aMap.put("green", 5);
    aMap.put("blue", 6);
    aMap.put("violet", 7);
    aMap.put("grey", 8);
    aMap.put("white", 9);
    RESISTOR_TABLE = Collections.unmodifiableMap(aMap);
  }

  int colorCode(String color) {
    return RESISTOR_TABLE.get(color);
  }

  String[] colors() {
    return RESISTOR_TABLE.entrySet().stream()
        .sorted((r1, r2) -> Integer.compare(r1.getValue(), r2.getValue()))
        .map(r -> r.getKey())
        .toArray(String[]::new);
  }
}
