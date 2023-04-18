import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('equals', () {
    test('throws an exception if the value is not equal', () {
      expect(
        () => require(1, label: 'value').equals(2),
        throwsA(isA<EqualityRequired>()),
      );
    });

    test('does not throw an exception if the value is equal', () {
      expect(
        () => require(1, label: 'value').equals(1),
        returnsNormally,
      );
    });
  });
}
