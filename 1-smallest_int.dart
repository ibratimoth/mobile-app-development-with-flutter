int getSmallestInteger(List<int> myList) {
    if (myList.isEmpty) {
        throw ArgumentError('The list cannot be empty');
  }

  myList.sort();

  return myList[0];
}
void main() {
  List<int> myNumbers = [5, 3, 9, 2, 7];
  int smallestNumber = getSmallestInteger(myNumbers);
  print('The smallest number is: $smallestNumber');
}