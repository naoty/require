import 'package:require/require.dart';

class ISBN {
  final String _value;

  ISBN(String value) : _value = value {
    require(_value, label: 'value')
        .startsWith('ISBN978-4-')
        .hasLength(22)
        .matches(r'^ISBN[0-9\-]+$');
  }

  @override
  String toString() => _value;
}

void main() {
  final validISBN = ISBN('ISBN978-4-7741-9613-5');
  print(validISBN);

  final invalidISBN = ISBN('ISBN978-4-abcd-efgh-i');
  print(invalidISBN);
}
