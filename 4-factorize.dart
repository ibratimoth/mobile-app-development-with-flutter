List<int> factorizeToPrimeNumbers(int number) {
  List<int> primeFactors = [];

  for (int i = 2; i <= number; i++) {
      while (number % i == 0) {
          primeFactors.add(i);
          number ~/= i; 
    }
  }

  return primeFactors;
}
void main() {
  int numberToFactorize = 30;
  List<int> result = factorizeToPrimeNumbers(numberToFactorize);

  print('Prime factors of $numberToFactorize are: $result');
}