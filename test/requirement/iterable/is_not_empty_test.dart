import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isNotEmpty', () {
    test('raises an exception when the value is empty', () {
      expect(
        () => require([]).isNotEmpty(),
        throwsA(isA<NonEmptyIterableRequired>()),
      );
    });

    test('does not raise an exception when the value is not empty', () {
      expect(
        () => require([1]).isNotEmpty(),
        returnsNormally,
      );
    });
  });
}
