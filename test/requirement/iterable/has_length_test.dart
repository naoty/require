import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('hasLength', () {
    test('raises an exception when the value does not have the required length',
        () {
      expect(
        () => require([1]).hasLength(2),
        throwsA(isA<IterableLengthRequired>()),
      );
    });

    test('does not raise an exception when the value has the required length',
        () {
      expect(
        () => require([1]).hasLength(1),
        returnsNormally,
      );
    });
  });
}
