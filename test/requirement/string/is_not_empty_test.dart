import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('isNotEmpty', () {
    test('raises an exception when a string is empty', () {
      expect(
        () => require('', label: 'value').isNotEmpty(),
        throwsA(isA<NotEmptyStringRequired>()),
      );
    });

    test('does not raise an exception when a string is not empty', () {
      expect(
        () => require('naoty', label: 'value').isNotEmpty(),
        returnsNormally,
      );
    });
  });
}
