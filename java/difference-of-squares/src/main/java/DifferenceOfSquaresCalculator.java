class DifferenceOfSquaresCalculator {

    private static int square(int x){
        return x * x;
    }

    int computeSquareOfSumTo(int n) {
        return square( n * (n + 1) / 2 );
    }

    int computeSumOfSquaresTo(int n) {
        return n * (n + 1) * (2 * n + 1) / 6;
    }

    int computeDifferenceOfSquares(int n) {
        return computeSquareOfSumTo(n) - computeSumOfSquaresTo(n);
    }
}
