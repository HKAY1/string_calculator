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
    if (delimiter.startsWith('[') && delimiter.endsWith(']')) {
      var delimiters = _extractDelimiters(delimiter);
      numbers = _replaceDelimiters(numbers, delimiters);
      delimiter = ','; // We've normalized all delimiters to comma
    } else {
      delimiter = defaultDelimiter;
    }
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
      } else if (number <= 1000) {
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

List<String> _extractDelimiters(String delimiterLine) {
  var delimiters = <String>[];
  var i = 0;

  while (i < delimiterLine.length) {
    if (delimiterLine[i] == '[') {
      var end = delimiterLine.indexOf(']', i);
      if (end != -1) {
        delimiters.add(delimiterLine.substring(i + 1, end));
        i = end + 1;
      } else {
        i++;
      }
    } else {
      i++;
    }
  }

  return delimiters;
}

// Helper method to replace all delimiters with comma
String _replaceDelimiters(String text, List<String> delimiters) {
  var result = text;
  for (var delimiter in delimiters) {
    result = result.replaceAll(delimiter, ',');
  }
  return result;
}
