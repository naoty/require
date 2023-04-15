import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isGreaterThanOrEqualTo', () {
    test(
        'raises an exception when the value is not greater than or equal to the required',
        () {
      expect(
        () => require(1).isGreaterThanOrEqualTo(2),
        throwsA(isA<NumGreaterThanOrEqualToRequired>()),
      );
    });

    test('does not raise an exception when the value is equal to the required',
        () {
      expect(
        () => require(1).isGreaterThanOrEqualTo(1),
        returnsNormally,
      );
    });

    test(
        'does not raise an exception when the value is greater than the required',
        () {
      expect(
        () => require(2).isGreaterThanOrEqualTo(1),
        returnsNormally,
      );
    });
  });
}
