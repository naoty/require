import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('isLessThan', () {
    test('raises an exception when the value is not less than the required',
        () {
      expect(
        () => require(2, label: 'value').isLessThan(1),
        throwsA(isA<NumLessThanRequired>()),
      );
    });

    test('does not raise an exception when the value is less than the required',
        () {
      expect(
        () => require(1, label: 'value').isLessThan(2),
        returnsNormally,
      );
    });
  });
}
