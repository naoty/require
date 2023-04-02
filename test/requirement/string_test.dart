import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('isNull', () {
    test('raises an exception when a string is not null', () {
      expect(
        () => require('naoty').isNull(),
        throwsA(isA<NullStringRequired>()),
      );
    });

    test('does not raise an exception when a string is null', () {
      final String? nullString = null;
      expect(() => require(nullString).isNull(), returnsNormally);
    });
  });

  group('isNotNull', () {
    test('raises an exception when a string is null', () {
      final String? nullString = null;
      expect(
        () => require(nullString).isNotNull(),
        throwsA(isA<NonNullStringRequired>()),
      );
    });

    test('does not raise an exception when a string is not null', () {
      expect(() => require('naoty').isNotNull(), returnsNormally);
    });
  });

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
    test('raises an exception when a string does not have a length', () {
      expect(
        () => require('naoty').hasLength(5),
        throwsA(isA<StringLengthRequired>()),
      );
    });

    test('does not raise an exception when a string has a length', () {
      expect(
        () => require('naoty').hasLength(6),
        returnsNormally,
      );
    });
  });

  group('hasLengthGreaterThan', () {
    test(
        'raises an exception when a string does not have a length greater than a value',
        () {
      expect(
        () => require('naoty').hasLengthGreaterThan(5),
        throwsA(isA<StringLengthGreaterThanRequired>()),
      );
    });

    test(
        'does not raise an exception when a string has a length greater than a value',
        () {
      expect(
        () => require('naoty').hasLengthGreaterThan(4),
        returnsNormally,
      );
    });
  });

  group('hasLengthGreaterThanOrEqualTo', () {
    test(
        'raises an exception when a string does not have a length greater than a value',
        () {
      expect(
        () => require('naoty').hasLengthGreaterThanOrEqualTo(6),
        throwsA(isA<StringLengthGreaterThanOrEqualToRequired>()),
      );
    });

    test('does not raise an exception when a string has a length', () {
      expect(
        () => require('naoty').hasLengthGreaterThanOrEqualTo(5),
        returnsNormally,
      );
    });

    test(
        'does not raise an exception when a string has a length greater than a value',
        () {
      expect(
        () => require('naoty').hasLengthGreaterThanOrEqualTo(4),
        returnsNormally,
      );
    });
  });

  group('hasLengthLessThan', () {
    test(
        'raises an exception when a string does not have a length less than a value',
        () {
      expect(
        () => require('naoty').hasLengthLessThan(5),
        throwsA(isA<StringLengthLessThanRequired>()),
      );
    });

    test(
        'does not raise an exception when a string has a length less than a value',
        () {
      expect(
        () => require('naoty').hasLengthLessThan(6),
        returnsNormally,
      );
    });
  });

  group('hasLengthLessThanOrEqualTo', () {
    test(
        'raises an exception when a string does not have a length less than a value',
        () {
      expect(
        () => require('naoty').hasLengthLessThanOrEqualTo(4),
        throwsA(isA<StringLengthLessThanOrEqualToRequired>()),
      );
    });

    test('does not raise an exception when a string has a length', () {
      expect(
        () => require('naoty').hasLengthLessThanOrEqualTo(5),
        returnsNormally,
      );
    });

    test(
        'does not raise an exception when a string has a length less than a value',
        () {
      expect(
        () => require('naoty').hasLengthLessThanOrEqualTo(6),
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

  group('startsWith', () {
    test('raises an exception when a string does not start with a prefix', () {
      expect(
        () => require('naoty').startsWith('ty'),
        throwsA(isA<StringPrefixRequired>()),
      );
    });

    test('does not raise an exception when a string starts with a prefix', () {
      expect(
        () => require('naoty').startsWith('nao'),
        returnsNormally,
      );
    });
  });

  group('endsWith', () {
    test('raises an exception when a string does not end with a suffix', () {
      expect(
        () => require('naoty').endsWith('nao'),
        throwsA(isA<StringSuffixRequired>()),
      );
    });

    test('does not raise an exception when a string ends with a suffix', () {
      expect(
        () => require('naoty').endsWith('ty'),
        returnsNormally,
      );
    });
  });
}
