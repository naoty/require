import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('endsWith', () {
    test('raises an exception when a string does not end with a suffix', () {
      expect(
        () => require('naoty', label: 'value').endsWith('nao'),
        throwsA(isA<StringSuffixRequired>()),
      );
    });

    test('does not raise an exception when a string ends with a suffix', () {
      expect(
        () => require('naoty', label: 'value').endsWith('ty'),
        returnsNormally,
      );
    });
  });
}
