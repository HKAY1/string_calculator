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

  List<int> parsedNumbers = [];
  List<int> negativeNumbers = [];
  for (var numberString in number) {
    if (numberString.trim().isNotEmpty) {
      var number = int.parse(numberString.trim());

      // Step 5: Check for negative numbers
      if (number < 0) {
        negativeNumbers.add(number);
      } else {
        parsedNumbers.add(number);
      }
    }
  }
  if (negativeNumbers.isNotEmpty) {
    throw ArgumentError(
      'negative numbers not allowed ${negativeNumbers.join(', ')}',
    );
  }

  return parsedNumbers.fold(0, (a, b) {
    return a + b;
  });
}
