import 'package:string_calculator/string_calculator.dart';

void main() {
  try {
    print(add(''));
    print(add('12'));
    print(add('1,2,3'));
    print(add('1\n2,5'));
    print(add('//,,\n1,,2'));
    print(add('1,2,3,5,1001'));
    print(add("1,10,-3,-7,-9"));
  } catch (e) {
    print(e);
  }
}
