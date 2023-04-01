import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('isEmpty', () {
    test('raises an exception when a string is not empty', () {
      expect(() => require('naoty').isEmpty(),
          throwsA(isA<EmptyStringRequired>()));
    });

    test('does not raise an exception when a string is empty', () {
      expect(() => require('').isEmpty(), returnsNormally);
    });
  });

  group('isNotEmpty', () {
    test('raises an exception when a string is empty', () {
      expect(() => require('').isNotEmpty(),
          throwsA(isA<NotEmptyStringRequired>()));
    });

    test('does not raise an exception when a string is not empty', () {
      expect(() => require('naoty').isNotEmpty(), returnsNormally);
    });
  });
}
