import 'package:require/require.dart';

class Name {
  final String first;
  final String last;

  Name({required this.first, required this.last}) {
    require(first).isNotEmpty();
    require(last).isNotEmpty();
  }
}

void main() {
  final name = Name(first: '', last: 'naoty');
  print(name);
}
