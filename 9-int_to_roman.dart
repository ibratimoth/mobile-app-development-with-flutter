import 'dart:io';

String intToRoman(int number) {
    if (number < 1 || number > 3999) {
      return "Invalid input. Please enter a number between 1 and 3999.";
  }

  final List<String> romanNumerals = [
    "M",
    "CM",
    "D",
    "CD",
    "C",
    "XC",
    "L",
    "XL",
    "X",
    "IX",
    "V",
    "IV",
    "I"
  ];

  final List<int> numeralValues = [
    1000,
    900,
    500,
    400,
    100,
    90,
    50,
    40,
    10,
    9,
    5,
    4,
    1
  ];

  StringBuffer result = StringBuffer();
  int i = 0;

  while (number > 0) {
    if (number >= numeralValues[i]) {
      result.write(romanNumerals[i]);
      number -= numeralValues[i];
    } else {
      i++;
    }
  }

  return result.toString();
}

void main() {
  stdout.write("Enter a number: ");
  String userInput = stdin.readLineSync() ?? "";
  try {
    int number = int.parse(userInput);
    print("Roman numeral for $number is: ${intToRoman(number)}");
  } catch (e) {
    print("Invalid input. Please enter a valid number.");
  }
}
