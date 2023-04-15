import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('equals', () {
    test('throws an exception if the value is not equal', () {
      expect(
        () => Subject(value: 1).equals(2),
        throwsA(isA<EqualityRequired>()),
      );
    });

    test('does not throw an exception if the value is equal', () {
      expect(() => Subject(value: 1).equals(1), returnsNormally);
    });
  });
}
