void getKeyMatrix(String key, List<List<int>> keyMatrix) {
  int k = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      keyMatrix[i][j] = key.codeUnitAt(k) % 65;
      k++;
    }
  }
}

void encrypt(List<List<int>> cipherMatrix, List<List<int>> keyMatrix,
    List<List<int>> messageVector) {
  int x, i, j;
  for (i = 0; i < 3; i++) {
    for (j = 0; j < 1; j++) {
      cipherMatrix[i][j] = 0;
      for (x = 0; x < 3; x++) {
        cipherMatrix[i][j] += keyMatrix[i][x] * messageVector[x][j];
      }

      cipherMatrix[i][j] = cipherMatrix[i][j] % 26;
    }
  }
}

String encryptHill(String message) {
  String key = "GYBNQKURP";
  List<List<int>> keyMatrix = List.generate(3, (_) => List<int>.filled(3, 0));
  getKeyMatrix(key, keyMatrix);

  List<List<int>> messageVector =
      List.generate(3, (_) => List<int>.filled(1, 0));

  for (int i = 0; i < 3; i++) {
    messageVector[i][0] = message.codeUnitAt(i) % 65;
  }

  List<List<int>> cipherMatrix =
      List.generate(3, (_) => List<int>.filled(1, 0));
  encrypt(cipherMatrix, keyMatrix, messageVector);

  String cipherText = "";

  for (int i = 0; i < 3; i++) {
    cipherText += String.fromCharCode(cipherMatrix[i][0] + 65);
  }

  return cipherText;
}
