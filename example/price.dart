import 'package:require/require.dart';

class Price {
  final double _value;

  Price(double value) : _value = value {
    require(_value).isGreaterThan(0).isLessThanOrEqualTo(100000);
  }

  @override
  String toString() => '$_value';
}

void main() {
  final price = Price(1000000);
  print(price);
}
