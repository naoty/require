import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('isNull', () {
    test('raises an exception when a num is not null', () {
      expect(
        () => require(1).isNull(),
        throwsA(isA<NullNumRequired>()),
      );
    });

    test('does not raise an exception when a num is null', () {
      final num? nullNum = null;
      expect(() => require(nullNum).isNull(), returnsNormally);
    });
  });

  group('isNotNull', () {
    test('raises an exception when a num is null', () {
      final num? nullNum = null;
      expect(
        () => require(nullNum).isNotNull(),
        throwsA(isA<NonNullNumRequired>()),
      );
    });

    test('does not raise an exception when a num is not null', () {
      expect(() => require(1).isNotNull(), returnsNormally);
    });
  });

  group('equals', () {
    test(
        'raises an exception when the value is not equal to the required value',
        () {
      expect(
        () => require(1).equals(2),
        throwsA(isA<NumEqualityRequired>()),
      );
    });

    test('does not raise an exception when the value is equal to the required',
        () {
      expect(
        () => require(1).equals(1),
        returnsNormally,
      );
    });
  });

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

  group('isLessThan', () {
    test('raises an exception when the value is not less than the required',
        () {
      expect(
        () => require(2).isLessThan(1),
        throwsA(isA<NumLessThanRequired>()),
      );
    });

    test('does not raise an exception when the value is less than the required',
        () {
      expect(
        () => require(1).isLessThan(2),
        returnsNormally,
      );
    });
  });

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
