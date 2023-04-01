import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('isEmpty', () {
    test('raises an exception when a string is not empty', () {
      expect(
        () => require('naoty').isEmpty(),
        throwsA(isA<EmptyStringRequired>()),
      );
    });

    test('does not raise an exception when a string is empty', () {
      expect(() => require('').isEmpty(), returnsNormally);
    });
  });

  group('isNotEmpty', () {
    test('raises an exception when a string is empty', () {
      expect(
        () => require('').isNotEmpty(),
        throwsA(isA<NotEmptyStringRequired>()),
      );
    });

    test('does not raise an exception when a string is not empty', () {
      expect(
        () => require('naoty').isNotEmpty(),
        returnsNormally,
      );
    });
  });

  group('hasLength', () {
    test('raises an exception when a string has a length less than min', () {
      expect(
        () => require('naoty').hasLength(min: 10, max: 11),
        throwsA(isA<StringLengthRequired>()),
      );
    });

    test('raises an exception when a string has a length greater than max', () {
      expect(
        () => require('naoty').hasLength(max: 3),
        throwsA(isA<StringLengthRequired>()),
      );
    });

    test(
        'does not raise an exception when a string has a length between min and max',
        () {
      expect(
        () => require('naoty').hasLength(min: 3, max: 10),
        returnsNormally,
      );
    });
  });

  group('matches', () {
    test('raises an exception when a string does not match a pattern', () {
      expect(
        () => require('nao ty').matches(r'^[a-z]+$'),
        throwsA(isA<StringMatchRequired>()),
      );
    });

    test('does not raise an exception when a string matches a pattern', () {
      expect(
        () => require('naoty').matches(r'[a-z]+'),
        returnsNormally,
      );
    });
  });
}
