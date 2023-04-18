import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('matches', () {
    test('raises an exception when a string does not match a pattern', () {
      expect(
        () => require('nao ty', label: 'value').matches(r'^[a-z]+$'),
        throwsA(isA<StringMatchRequired>()),
      );
    });

    test('does not raise an exception when a string matches a pattern', () {
      expect(
        () => require('naoty', label: 'value').matches(r'[a-z]+'),
        returnsNormally,
      );
    });
  });
}
