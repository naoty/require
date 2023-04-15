import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
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
}
