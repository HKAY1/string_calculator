import 'package:string_calculator/string_calculator.dart';

void main() {
  print('=== String Calculator Kata Tests ===\n');

  // Step 1: Basic functionality
  print('Step 1: Basic String Calculator');
  print('Empty string: ${add("")}'); // Should return 0
  print('Single number "1": ${add("1")}'); // Should return 1
  print('Two numbers "1,2": ${add("1,2")}'); // Should return 3
  print("");

  // Step 2: Unknown amount of numbers
  print('Step 2: Unknown amount of numbers');
  print('"1,2,3,4,5": ${add("1,2,3,4,5")}'); // Should return 15
  print('"10,20,30": ${add("10,20,30")}'); // Should return 60
  print("");

  // Step 3: New lines between numbers
  print('Step 3: New lines between numbers');
  print('"1\\n2,3": ${add("1\n2,3")}'); // Should return 6
  print('"1,2\\n3": ${add("1,2\n3")}'); // Should return 6
  print("");

  // Step 4: Different delimiters
  print('Step 4: Different delimiters');
  print('"//;\\n1;2": ${add("//;\n1;2")}'); // Should return 3
  print('"//|\\n1|2|3": ${add("//|\n1|2|3")}'); // Should return 6
  print("");

  // Step 5: Negative numbers (will throw exceptions)
  print('Step 5: Negative numbers');
  try {
    add("1,-2,3");
  } catch (e) {
    print('Single negative: $e');
  }

  try {
    add("1,-2,-3,4");
  } catch (e) {
    print('Multiple negatives: $e');
  }
  print("");

  // Step 6: Numbers bigger than 1000
  print('Step 6: Numbers bigger than 1000 ignored');
  print('"2,1001": ${add("2,1001")}'); // Should return 2
  print('"1000,1001,2": ${add("1000,1001,2")}'); // Should return 1002
  print("");

  // Step 7: Delimiters of any length
  print('Step 7: Delimiters of any length');
  print(
    '"//[***]\\n1***2***3": ${add("//[***]\n1***2***3")}',
  ); // Should return 6
  print(
    '"//[abc]\\n1abc2abc3": ${add("//[abc]\n1abc2abc3")}',
  ); // Should return 6
  print("");

  // Step 8: Multiple delimiters
  print('Step 8: Multiple delimiters');
  print('"//[*][%]\\n1*2%3": ${add("//[*][%]\n1*2%3")}'); // Should return 6
  print(
    '"//[;][|]\\n1;2|3;4": ${add("//[;][|]\n1;2|3;4")}',
  ); // Should return 10
  print("");

  // Step 9: Multiple delimiters with length longer than one char
  print('Step 9: Multiple long delimiters');
  print(
    '"//[***][%%%]\\n1***2%%%3": ${add("//[***][%%%]\n1***2%%%3")}',
  ); // Should return 6
  print(
    '"//[abc][def]\\n1abc2def3abc4": ${add("//[abc][def]\n1abc2def3abc4")}',
  ); // Should return 10
  print("");

  // Complex example combining multiple features
  print('Complex example:');
  print(
    '"//[**][##]\\n1**2##3\\n4**1001##5": ${add("//[**][##]\n1**2##3\n4**1001##5")}',
  ); // Should return 15 (1001 ignored)
  print("");
}
