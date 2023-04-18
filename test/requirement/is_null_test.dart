import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isNull', () {
    test('throws an exception if the value is not null', () {
      expect(
        () => require(1, label: 'value').isNull(),
        throwsA(isA<NullabilityRequired>()),
      );
    });

    test('does not throw an exception if the value is null', () {
      expect(
        () => require(null, label: 'value').isNull(),
        returnsNormally,
      );
    });
  });
}
