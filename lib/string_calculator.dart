int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  final String defaultDelimiter = ',';
  String delimiter = defaultDelimiter;

  if (numbers.startsWith('//')) {
    final int delimiterEndIndex = numbers.indexOf('\n');
    delimiter = numbers.substring(2, delimiterEndIndex);
    numbers = numbers.substring(delimiterEndIndex + 1);
  } else {
    delimiter = defaultDelimiter;
  }

  numbers = numbers.replaceAll('\n', delimiter);
  final List<String> number = numbers.split(delimiter);

  return number.fold(0, (a, b) {
    return a + int.parse(b);
  });
}
