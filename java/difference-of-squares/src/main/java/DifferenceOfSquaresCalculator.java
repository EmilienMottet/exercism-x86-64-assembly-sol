import java.util.stream.IntStream;

class DifferenceOfSquaresCalculator {

  int computeSquareOfSumTo(int input) {
    return (int) Math.pow(IntStream.rangeClosed(1, input).sum(), 2);
  }

  int computeSumOfSquaresTo(int input) {
    return IntStream.rangeClosed(1, input).map(x -> x * x).sum();
  }

  int computeDifferenceOfSquares(int input) {
    return computeSquareOfSumTo(input) - computeSumOfSquaresTo(input);
  }
}
