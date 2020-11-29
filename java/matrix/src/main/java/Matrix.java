import java.util.Arrays;

class Matrix {
  private int[][] matrix;

  Matrix(String matrixAsString) {
    String[] lines = matrixAsString.split("\n");
    matrix = new int[lines.length][lines.length];
    for (int i = 0; i < lines.length; i++) {
      int[] row = Arrays.stream(lines[i].split(" ")).mapToInt((n) -> Integer.valueOf(n)).toArray();
      matrix[i] = row;
    }
  }

  int[] getRow(int rowNumber) {
    return matrix[rowNumber - 1];

  }

  int[] getColumn(int columnNumber) {
    return Arrays.stream(matrix).mapToInt((r) -> r[columnNumber - 1]).toArray();
  }
}
