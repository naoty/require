import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isGreaterThan', () {
    test('raises an exception when the value is not greater than the required',
        () {
      expect(
        () => require(1).isGreaterThan(2),
        throwsA(isA<NumGreaterThanRequired>()),
      );
    });

    test(
        'does not raise an exception when the value is greater than the required',
        () {
      expect(
        () => require(2).isGreaterThan(1),
        returnsNormally,
      );
    });
  });
}
