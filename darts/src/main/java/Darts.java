class Darts {
  private double x, y;

  Darts(double x, double y) {
    this.x = x;
    this.y = y;
  }

  int score() {
    double radius = Math.sqrt(x * x + y * y);
    if (radius <= 1) {
      return 10;
    } else if (radius <= 5) {
      return 5;
    } else if (radius <= 10) {
      return 1;
    } else {
      return 0;
    }
  }
}
