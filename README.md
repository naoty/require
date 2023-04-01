# require
A dart package to support design by contract in declarative style

## Usage

```dart
import 'package:require/require.dart';

class Customer {
  final String name;
  final int age;

  Customer({required this.name, required this.age}) {
    require(name, label: 'name')
      .hasLengthGreaterThanOrEqualTo(1)
      .hasLengthLessThan(20)
      .matches('^[a-zA-Z]+$');
    require(age, label: 'age')
      .isGreaterThanOrEqualTo(0)
      .isLessThan(200);
  }
}
```
