import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;

class ProteinTranslator {

  private static final Map<String, String> proteinTranslatorMap;
  static {
    final Map<String, String> aMap = new HashMap();
    aMap.put("UGU", "Cysteine");
    aMap.put("UGC", "Cysteine");
    aMap.put("UUA", "Leucine");
    aMap.put("UUG", "Leucine");
    aMap.put("AUG", "Methionine");
    aMap.put("UUU", "Phenylalanine");
    aMap.put("UUC", "Phenylalanine");
    aMap.put("UCU", "Serine");
    aMap.put("UCC", "Serine");
    aMap.put("UCA", "Serine");
    aMap.put("UCG", "Serine");
    aMap.put("UGG", "Tryptophan");
    aMap.put("UAU", "Tyrosine");
    aMap.put("UAC", "Tyrosine");
    aMap.put("UAA", "STOP");
    aMap.put("UAG", "STOP");
    aMap.put("UGA", "STOP");

    proteinTranslatorMap = Collections.unmodifiableMap(aMap);
  }

  List<String> translate(final String rnaSequence) {
    return Arrays.stream(rnaSequence.split("(?<=\\G...)")).map(e -> proteinTranslatorMap.get(e))
        .takeWhile(e -> !"STOP".equals(e)).collect(Collectors.toList());
  }
}
