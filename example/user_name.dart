import 'package:require/require.dart';

class UserName {
  final String first;
  final String last;
  final String? middle;

  UserName({required this.first, required this.last, this.middle}) {
    require(first, label: 'first')
        .hasLengthGreaterThan(0)
        .hasLengthLessThan(20)
        .matches(r'^[a-zA-Z]+$');
    require(last, label: 'last')
        .hasLengthGreaterThan(0)
        .hasLengthLessThan(20)
        .matches(r'^[a-zA-Z]+$');
  }
}

void main() {
  final userName = UserName(first: 'John', last: '1111111111111111111111111');
  print(userName);
}
