class RaindropConverter {

  String convert(int number) {
    StringBuilder res = new StringBuilder();
    if (number % 3 == 0) {
      res.append("Pling");

    }
    if (number % 5 == 0) {
      res.append("Plang");

    }
    if (number % 7 == 0) {
      res.append("Plong");

    }
    return res.length() == 0 ? Integer.toString(number) : res.toString();
  }

}
