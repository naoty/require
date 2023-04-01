import 'package:require/require.dart';

class Name {
  final String first;
  final String last;

  Name({required this.first, required this.last}) {
    require(first).hasLength(min: 1, max: 10).matches(r'^[a-zA-Z]+$');
    require(last).hasLength(min: 1, max: 10).matches(r'^[a-zA-Z]+$');
  }
}

void main() {
  final name = Name(first: 'nao to', last: 'kaneko');
  print(name);
}
