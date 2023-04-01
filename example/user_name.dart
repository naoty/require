import 'package:require/require.dart';

class UserName {
  final String first;
  final String last;
  final String? middle;

  UserName({required this.first, required this.last, this.middle}) {
    require(first, label: 'first').isNotEmpty().matches(r'^[a-zA-Z]+$');
    require(last, label: 'last').isNotEmpty().matches(r'^[a-zA-Z]+$');
  }
}

void main() {
  final userName = UserName(first: 'John', last: '12');
  print(userName);
}
