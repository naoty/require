import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('predicate', () {
    test('throws an exception if the predicate is not satisfied', () {
      expect(
          () => Subject(value: 1).predicate((value) => value > 1,
              message: 'Value must be greater than 1'),
          throwsA(isA<PredicateSatisfactionRequired>().having(
              (e) => e.toString(),
              'toString()',
              equals('Value must be greater than 1'))));
    });
  });
}
