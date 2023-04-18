import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isEmpty', () {
    test('raises an exception when the value is not empty', () {
      expect(
        () => require([1], label: 'value').isEmpty(),
        throwsA(isA<EmptyIterableRequired>()),
      );
    });

    test('does not raise an exception when the value is empty', () {
      expect(
        () => require([], label: 'value').isEmpty(),
        returnsNormally,
      );
    });
  });
}
