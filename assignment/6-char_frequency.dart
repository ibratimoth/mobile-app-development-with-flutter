Map<String, int> characterFrequency(String inputString) {
  Map<String, int> frequencyMap = {};

  for (int i = 0; i < inputString.length; i++) {
    String currentChar = inputString[i].toLowerCase();

    if (currentChar.replaceAll(RegExp(r'[a-z]'), '').isEmpty) {
          frequencyMap[currentChar] = frequencyMap.containsKey(currentChar)
          ? frequencyMap[currentChar]! + 1
          : 1;
    }
  }

  return frequencyMap;
}
void main() {
  String testString = "Hello, World!";
  Map<String, int> result = characterFrequency(testString);

  print('Character frequency in "$testString": $result');
}