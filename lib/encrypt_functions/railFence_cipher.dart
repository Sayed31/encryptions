String encryptRailFence(String text) {
  int key = 4;
  List<List<String>> rail =
      List.generate(key, (_) => List<String>.filled(text.length, '\n'));

  bool dirDown = false;
  int row = 0, col = 0;

  for (int i = 0; i < text.length; i++) {
    if (row == 0 || row == key - 1) dirDown = !dirDown;
    rail[row][col++] = text[i];

    if (dirDown)
      row++;
    else
      row--;
  }

  StringBuffer result = StringBuffer();
  for (int i = 0; i < key; i++) {
    for (int j = 0; j < text.length; j++) {
      if (rail[i][j] != '\n') result.write(rail[i][j]);
    }
  }

  return result.toString();
}

String decryptRailFence(String cipher) {
  int key = 2;
  List<List<String>> rail =
      List.generate(key, (_) => List<String>.filled(cipher.length, '\n'));

  bool dirDown = true;
  int row = 0, col = 0;

  for (int i = 0; i < cipher.length; i++) {
    if (row == 0) dirDown = true;
    if (row == key - 1) dirDown = false;
    rail[row][col++] = '*';

    if (dirDown)
      row++;
    else
      row--;
  }

  int index = 0;
  for (int i = 0; i < key; i++) {
    for (int j = 0; j < cipher.length; j++) {
      if (rail[i][j] == '*' && index < cipher.length) {
        rail[i][j] = cipher[index++];
      }
    }
  }

  StringBuffer result = StringBuffer();

  row = 0;
  col = 0;
  for (int i = 0; i < cipher.length; i++) {
    if (row == 0) dirDown = true;
    if (row == key - 1) dirDown = false;
    if (rail[row][col] != '*') {
      result.write(rail[row][col++]);
    }

    if (dirDown)
      row++;
    else
      row--;
  }

  return result.toString();
}
