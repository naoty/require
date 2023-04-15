import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
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
}
