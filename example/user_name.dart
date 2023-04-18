import 'package:require/require.dart';

class UserName {
  final String first;
  final String? middle;
  final String last;

  UserName({required this.first, this.middle, required this.last}) {
    require(first, label: 'first')
        .isNotEmpty()
        .hasLengthLessThan(20)
        .matches(r'^[a-zA-Z]+$');
    requireIfNotNull(middle, label: 'middle')
        ?.isNotEmpty()
        .hasLengthLessThan(20)
        .matches(r'^[a-zA-Z]+$');
    require(last, label: 'last')
        .isNotEmpty()
        .hasLengthLessThan(20)
        .matches(r'^[a-zA-Z]+$');
  }
}

void main() {
  final userName = UserName(first: 'Naoto', last: 'Kaneko');
  print(userName);
}
