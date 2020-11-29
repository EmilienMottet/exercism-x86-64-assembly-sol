import java.util.stream.IntStream;

class NaturalNumber {
  private final int number;
  private final Classification classification;

  NaturalNumber(final int number) {
    this.number = number;
    classification = determineClassification(number);

  }

  private static Classification determineClassification(final int number) {
    if (number < 1) {
      throw new IllegalArgumentException("You must supply a natural number (positive integer)");
    }
    final int aliquotSum = IntStream.rangeClosed(1, number / 2).filter((n) -> number % n == 0).sum();
    if (aliquotSum > number) {
      return Classification.ABUNDANT;
    } else if (aliquotSum < number) {
      return Classification.DEFICIENT;
    } else {
      return Classification.PERFECT;
    }
  }

  Classification getClassification() {
    return classification;
  }

}
