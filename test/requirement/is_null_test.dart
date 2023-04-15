import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('isNull', () {
    test('throws an exception if the value is not null', () {
      expect(
        () => Subject(value: 1).isNull(),
        throwsA(isA<NullabilityRequired>()),
      );
    });

    test('does not throw an exception if the value is null', () {
      expect(() => Subject(value: null).isNull(), returnsNormally);
    });
  });
}
