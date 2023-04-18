import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('predicate', () {
    test('throws an exception if the predicate is not satisfied', () {
      expect(
          () => require(1, label: 'value').predicate(
                (value) => value > 1,
                message: 'must be greater than 1',
              ),
          throwsA(isA<PredicateRequired>().having(
            (e) => e.toString(),
            'toString()',
            equals('value must be greater than 1'),
          )));
    });

    test('does not throw an exception if the predicate is satisfied', () {
      expect(
        () => require(1, label: 'value').predicate(
          (value) => value > 0,
          message: 'must be greater than 0',
        ),
        returnsNormally,
      );
    });
  });
}
