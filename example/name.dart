import 'package:require/require.dart';

class Name {
  final String first;
  final String last;

  Name({required this.first, required this.last}) {
    require(first).hasLength(min: 1, max: 10);
    require(last).hasLength(min: 1, max: 10);
  }
}

void main() {
  final name = Name(first: '', last: 'naoty');
  print(name);
}
