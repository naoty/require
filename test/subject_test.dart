import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('equals', () {
    test('throws an exception if the value is not equal', () {
      expect(
        () => Subject(value: 1).equals(2),
        throwsA(isA<EqualityRequired>()),
      );
    });

    test('does not throw an exception if the value is equal', () {
      expect(() => Subject(value: 1).equals(1), returnsNormally);
    });
  });

  group('predicate', () {
    test('throws an exception if the predicate is not satisfied', () {
      expect(
          () => Subject(value: 1).predicate(
                (value) => value > 1,
                message: 'Value must be greater than 1',
              ),
          throwsA(isA<PredicateSatisfactionRequired>().having(
            (e) => e.toString(),
            'toString()',
            equals('Value must be greater than 1'),
          )));
    });

    test('does not throw an exception if the predicate is satisfied', () {
      expect(
        () => Subject(value: 1).predicate(
          (value) => value > 0,
          message: 'Value must be greater than 0',
        ),
        returnsNormally,
      );
    });
  });
}
