import 'package:require/require.dart';

extension NumRequirement on Subject<num> {
  Subject<num> equals(num value) {
    if (this.value != value) {
      throw NumEqualityRequired(value: this.value, required: value);
    }
    return this;
  }

  Subject<num> isGreaterThan(num value) {
    if (this.value <= value) {
      throw NumGreaterThanRequired(value: this.value, required: value);
    }
    return this;
  }

  Subject<num> isGreaterThanOrEqualTo(num value) {
    if (this.value < value) {
      throw NumGreaterThanOrEqualToRequired(value: this.value, required: value);
    }
    return this;
  }

  Subject<num> isLessThan(num value) {
    if (this.value >= value) {
      throw NumLessThanRequired(value: this.value, required: value);
    }
    return this;
  }

  Subject<num> isLessThanOrEqualTo(num value) {
    if (this.value > value) {
      throw NumLessThanOrEqualToRequired(value: this.value, required: value);
    }
    return this;
  }
}

class NumEqualityRequired implements Exception {
  final num _value;
  final num _required;

  NumEqualityRequired({required num value, required num required})
      : _value = value,
        _required = required;

  @override
  String toString() => "$_value is required to be equal to $_required";
}

class NumGreaterThanRequired implements Exception {
  final num _value;
  final num _required;

  NumGreaterThanRequired({required num value, required num required})
      : _value = value,
        _required = required;

  @override
  String toString() => "$_value is required to be greater than $_required";
}

class NumGreaterThanOrEqualToRequired implements Exception {
  final num _value;
  final num _required;

  NumGreaterThanOrEqualToRequired({required num value, required num required})
      : _value = value,
        _required = required;

  @override
  String toString() =>
      "$_value is required to be greater than or equal to $_required";
}

class NumLessThanRequired implements Exception {
  final num _value;
  final num _required;

  NumLessThanRequired({required num value, required num required})
      : _value = value,
        _required = required;

  @override
  String toString() => "$_value is required to be less than $_required";
}

class NumLessThanOrEqualToRequired implements Exception {
  final num _value;
  final num _required;

  NumLessThanOrEqualToRequired({required num value, required num required})
      : _value = value,
        _required = required;

  @override
  String toString() =>
      "$_value is required to be less than or equal to $_required";
}
