import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isNotNull', () {
    test('throws an exception if the value is null', () {
      expect(
        () => require(null, label: 'value').isNotNull(),
        throwsA(isA<NonNullabilityRequired>()),
      );
    });

    test('does not throw an exception if the value is not null', () {
      expect(
        () => require(1, label: 'value').isNotNull(),
        returnsNormally,
      );
    });
  });
}
