import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isNull', () {
    test('raises an exception when an iterable is not null', () {
      expect(
        () => require([1]).isNull(),
        throwsA(isA<NullIterableRequired>()),
      );
    });

    test('does not raise an exception when an iterable is null', () {
      final Iterable? nullIterable = null;
      expect(() => require(nullIterable).isNull(), returnsNormally);
    });
  });

  group('isNotNull', () {
    test('raises an exception when an iterable is null', () {
      final Iterable? nullIterable = null;
      expect(
        () => require(nullIterable).isNotNull(),
        throwsA(isA<NonNullIterableRequired>()),
      );
    });

    test('does not raise an exception when an iterable is not null', () {
      expect(() => require([1]).isNotNull(), returnsNormally);
    });
  });

  group('ifNotNull', () {
    test('returns null when an iterable is null', () {
      final Iterable? nullIterable = null;
      expect(require(nullIterable).ifNotNull(), isNull);
    });

    test('returns a subject when an iterable is not null', () {
      expect(require([1]).ifNotNull(), isA<Subject<Iterable>>());
    });
  });

  group('isEmpty', () {
    test('raises an exception when the value is not empty', () {
      expect(
        () => require([1]).isEmpty(),
        throwsA(isA<EmptyIterableRequired>()),
      );
    });

    test('does not raise an exception when the value is empty', () {
      expect(
        () => require([]).isEmpty(),
        returnsNormally,
      );
    });
  });

  group('isNotEmpty', () {
    test('raises an exception when the value is empty', () {
      expect(
        () => require([]).isNotEmpty(),
        throwsA(isA<NotEmptyIterableRequired>()),
      );
    });

    test('does not raise an exception when the value is not empty', () {
      expect(
        () => require([1]).isNotEmpty(),
        returnsNormally,
      );
    });
  });

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
