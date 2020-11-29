import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

class DnDCharacter {
  private int strength;
  private int dexterity;
  private int constitution;
  private int intelligence;
  private int wisdom;
  private int charisma;

  DnDCharacter() {
    strength = ability();
    dexterity = ability();
    constitution = ability();
    intelligence = ability();
    wisdom = ability();
    charisma = ability();
  }

  private int run_dice() {
    return new Random().nextInt(6) + 1;
  }

  private List<Integer> run_n_dice(final int n) {
    List<Integer> diceList = new LinkedList<>();
    for (int i = 0; i < n; i++) {
      diceList.add(run_dice());
    }
    return diceList;
  }

  int ability() {
    List<Integer> diceList = run_n_dice(4);
    return diceList.stream().collect(Collectors.summingInt(Integer::intValue))
        - diceList.stream().min(Integer::compare).get();
  }

  int modifier(final int input) {
    return (int) Math.floor((input - 10) / 2.);
  }

  int getStrength() {
    return strength;
  }

  int getDexterity() {
    return dexterity;

  }

  int getConstitution() {
    return constitution;

  }

  int getIntelligence() {
    return intelligence;

  }

  int getWisdom() {
    return wisdom;

  }

  int getCharisma() {
    return charisma;

  }

  int getHitpoints() {
    return modifier(getConstitution()) + 10;
  }
}
