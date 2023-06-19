// Encrypts a plaintext using the Row Transposition Cipher with the specified key.
String encryptRowTransposition(String plaintext) {
  String key = "4312567";

  // Determine the number of columns in the transposition grid.
  int numColumns = key.length;

  // Determine the number of rows in the transposition grid.
  int numRows = (plaintext.length / numColumns).ceil();

  // Pad the plaintext with extra characters if needed to fill out the last row of the transposition grid.
  int extraChars = numColumns - (plaintext.length % numColumns);
  String paddedPlaintext =
      plaintext.padRight(plaintext.length + extraChars, 'X');

  // Construct the transposition grid using the key.
  List<List<String>> transpositionGrid =
      List.generate(numRows, (_) => List.filled(numColumns, ' '));
  for (int i = 0; i < numColumns; i++) {
    int columnIndex = key.codeUnitAt(i) - '1'.codeUnitAt(0);
    for (int j = 0; j < numRows; j++) {
      transpositionGrid[j][columnIndex] = paddedPlaintext[numColumns * j + i];
    }
  }

  // Read out the characters of the transposition grid in column-major order to obtain the ciphertext.
  StringBuffer sb = StringBuffer();
  for (int i = 0; i < numColumns; i++) {
    for (int j = 0; j < numRows; j++) {
      sb.write(transpositionGrid[j][i]);
    }
  }
  return sb.toString();
}

String decryptRowTransposition(String cipher) {
  String key = "4312567";
  int numRows = (cipher.length / key.length).ceil();
  int numCols = key.length;

  List<List<String>> matrix =
      List.generate(numRows, (_) => List<String>.filled(numCols, ''));

  int charIndex = 0;
  for (int col = 0; col < numCols; col++) {
    int keyIndex = key.indexOf((col + 1).toString());
    for (int row = 0; row < numRows; row++) {
      if (charIndex < cipher.length) {
        matrix[row][keyIndex] = cipher[charIndex++];
      }
    }
  }

  StringBuffer plaintext = StringBuffer();

  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      if (matrix[row][col].isNotEmpty) {
        plaintext.write(matrix[row][col]);
      }
    }
  }

  return plaintext.toString();
}
