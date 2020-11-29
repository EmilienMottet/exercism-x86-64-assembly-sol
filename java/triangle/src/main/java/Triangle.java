class Triangle {
  private final double s1, s2, s3;

  private static boolean inequality(final double s1, final double s2, final double s3) {
    return s1 < s2 + s3 && s2 < s1 + s3 && s3 < s1 + s2;
  }

  Triangle(final double side1, final double side2, final double side3) throws TriangleException {
    if (!inequality(side1, side2, side3)) {
      throw new TriangleException();
    }
    s1 = side1;
    s2 = side2;
    s3 = side3;

  }

  boolean isEquilateral() {
    return s1 == s2 && s2 == s3 && s1 == s3;
  }

  boolean isIsosceles() {
    return s1 == s2 || s2 == s3 || s1 == s3;
  }

  boolean isScalene() {
    return !isEquilateral() && !isIsosceles();
  }

}
