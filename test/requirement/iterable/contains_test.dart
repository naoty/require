import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('contains', () {
    test(
        'raises an exception when the value does not contain the required element',
        () {
      expect(
        () => require([1]).contains(2),
        throwsA(isA<IterableContainingRequired>()),
      );
    });

    test(
        'does not raise an exception when the value contains the required element',
        () {
      expect(
        () => require([1]).contains(1),
        returnsNormally,
      );
    });
  });
}
