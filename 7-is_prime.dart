bool isPrime(int number) {
  if (number <= 1) {
     return false; 
  }

  for (int i = 2; i <= (number / 2).floor(); i++) {
      if (number % i == 0) {
          return false; 
    }
  }

  return true; 
}
void main() {
  int testNumber = 17;
  bool result = isPrime(testNumber);

  if (result) {
    print('$testNumber is a prime number.');
  } else {
    print('$testNumber is not a prime number.');
  }
}
