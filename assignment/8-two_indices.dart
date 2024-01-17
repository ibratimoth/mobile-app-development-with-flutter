List<int> findTwoNumbersWithSum(List<int> numbers, int target) {
  Map<int, int> indexMap = {};

  for (int i = 0; i < numbers.length; i++) {
    int complement = target - numbers[i];

    if (indexMap.containsKey(complement)) {
      return [indexMap[complement]!, i];
    }

    indexMap[numbers[i]] = i;
  }

  return [];
}

void main() {
  
  List<int> numbers = [2, 7, 11, 15];
  int target = 9;
  
  List<int> result = findTwoNumbersWithSum(numbers, target);

  if (result.isNotEmpty) {
    print('Indices of the two numbers that add up to $target: $result');
  } else {
    print('No such pair found.');
  }
}
