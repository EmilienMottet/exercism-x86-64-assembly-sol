import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

class HandshakeCalculator {

    private static final Map<Integer, Signal> SIGNAL_MAP;
    static {
        Map<Integer, Signal> aMap = new HashMap<>();
        aMap.put(0b1, Signal.WINK);
        aMap.put(0b10, Signal.DOUBLE_BLINK);
        aMap.put(0b100, Signal.CLOSE_YOUR_EYES);
        aMap.put(0b1000, Signal.JUMP);
        SIGNAL_MAP = Collections.unmodifiableMap(aMap);
    }

    List<Signal> calculateHandshake(int number) {
        int reverseKey = 0b10000;
        boolean isReverse = (number & reverseKey) == reverseKey;
        List<Signal> res = SIGNAL_MAP.entrySet().stream().filter(e -> (e.getKey() & number) == e.getKey())
                .map(e -> e.getValue()).collect(Collectors.toList());
        if (isReverse) {
            Collections.reverse(res);
            return res;

        } else {
            return res;
        }
    }
}
