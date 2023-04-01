import 'package:require/require.dart';

class ISBN {
  final String _value;

  ISBN({required String value}) : _value = value {
    require(_value)
        .startsWith('ISBN978-4-')
        .hasLength(min: 21, max: 22)
        .matches(r'^ISBN[0-9\-]+$');
  }

  @override
  String toString() => _value;
}

void main() {
  final validISBN = ISBN(value: 'ISBN978-4-7741-9613-5');
  print(validISBN);

  final invalidISBN = ISBN(value: 'ISBN978-4-abcd-efgh-i');
  print(invalidISBN);
}
