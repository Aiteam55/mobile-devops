import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Simple Math Test', () {
    test('adds 1 + 2 to equal 3', () {
      final result = add(1, 2);
      expect(result, 3);
    });
  });
}

// This function is not part of the test, it's just an example
int add(int a, int b) {
  return a + b;
}
