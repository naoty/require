import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isNotNull', () {
    test('throws an exception if the value is null', () {
      expect(
        () => Subject(value: null).isNotNull(),
        throwsA(isA<NonNullabilityRequired>()),
      );
    });

    test('does not throw an exception if the value is not null', () {
      expect(() => Subject(value: 1).isNotNull(), returnsNormally);
    });
  });
}
