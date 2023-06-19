String encryptMonoalphabetic(String s) {
  String encryptedString = '';
  for (int i = 0; i < s.length; i++) {
    bool found = false;
    for (int j = 0; j < 26; j++) {
      if (s[i] == normalChar[j]) {
        encryptedString += codedChar[j];
        found = true;
        break;
      }
    }
    if (!found || !normalChar.contains(s[i].toLowerCase())) {
      encryptedString += s[i];
    }
  }
  return encryptedString;
}

String decryptMonoalphabetic(String s) {
  String decryptedString = '';
  for (int i = 0; i < s.length; i++) {
    bool found = false;
    for (int j = 0; j < 26; j++) {
      if (s[i] == codedChar[j]) {
        decryptedString += normalChar[j];
        found = true;
        break;
      }
    }
    if (!found || !codedChar.contains(s[i].toUpperCase())) {
      decryptedString += s[i];
    }
  }
  return decryptedString;
}

List<String> normalChar = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];
List<String> codedChar = [
  'E',
  'X',
  'A',
  'M',
  'P',
  'L',
  'B',
  'C',
  'D',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'N',
  'O',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'Y',
  'Z',
];
