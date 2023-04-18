import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isGreaterThan', () {
    test('raises an exception when the value is not greater than the required',
        () {
      expect(
        () => require(1, label: 'value').isGreaterThan(2),
        throwsA(isA<NumGreaterThanRequired>()),
      );
    });

    test(
        'does not raise an exception when the value is greater than the required',
        () {
      expect(
        () => require(2, label: 'value').isGreaterThan(1),
        returnsNormally,
      );
    });
  });
}
