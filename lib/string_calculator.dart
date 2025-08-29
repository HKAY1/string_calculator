int add(String number) {
  if (number.isEmpty) {
    return 0;
  }
  final List<String> numbers = number.split(',');

  return numbers.fold(0, (a, b) => a + int.parse(b));
}
