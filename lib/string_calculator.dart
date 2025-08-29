int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  final String delimiter = ',';

  numbers = numbers.replaceAll('\n', delimiter);
  final List<String> number = numbers.split(delimiter);

  return number.fold(0, (a, b) => a + int.parse(b));
}
