import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isLessThanOrEqualTo', () {
    test(
        'raises an exception when the value is not less than or equal to the required',
        () {
      expect(
        () => require(2).isLessThanOrEqualTo(1),
        throwsA(isA<NumLessThanOrEqualToRequired>()),
      );
    });

    test('does not raise an exception when the value is equal to the required',
        () {
      expect(
        () => require(1).isLessThanOrEqualTo(1),
        returnsNormally,
      );
    });

    test('does not raise an exception when the value is less than the required',
        () {
      expect(
        () => require(1).isLessThanOrEqualTo(2),
        returnsNormally,
      );
    });
  });
}
