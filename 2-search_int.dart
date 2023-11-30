void main() {
   List<int> myList = [1, 2, 3, 4, 5];
   int target = 3;

   int result = findIndexOfFirstOccurrence(myList, target);

   if (result != -1) {
        print("The first occurrence of $target is at index $result.");
   } else {
        print("$target not found in the list.");
   }
}

int findIndexOfFirstOccurrence(List<int> myList, int target) {
   for (int i = 0; i < myList.length; i++) {
      if (myList[i] == target) {
          return i;
     }
   }
   return -1;
}