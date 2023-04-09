import 'package:require/require.dart';

extension NumRequirement on Subject<num> {
  Subject<num> isGreaterThan(num value) {
    if (this.value <= value) {
      throw NumGreaterThanRequired(
        value: this.value,
        required: value,
        label: label,
      );
    }
    return this;
  }

  Subject<num> isGreaterThanOrEqualTo(num value) {
    if (this.value < value) {
      throw NumGreaterThanOrEqualToRequired(
        value: this.value,
        required: value,
        label: label,
      );
    }
    return this;
  }

  Subject<num> isLessThan(num value) {
    if (this.value >= value) {
      throw NumLessThanRequired(
        value: this.value,
        required: value,
        label: label,
      );
    }
    return this;
  }

  Subject<num> isLessThanOrEqualTo(num value) {
    if (this.value > value) {
      throw NumLessThanOrEqualToRequired(
        value: this.value,
        required: value,
        label: label,
      );
    }
    return this;
  }
}

class NumGreaterThanRequired implements Exception {
  final num _value;
  final num _required;
  final String? _label;

  NumGreaterThanRequired({
    required num value,
    required num required,
    String? label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to be greater than $_required";
    } else {
      return "$_value is required to be greater than $_required";
    }
  }
}

class NumGreaterThanOrEqualToRequired implements Exception {
  final num _value;
  final num _required;
  final String? _label;

  NumGreaterThanOrEqualToRequired({
    required num value,
    required num required,
    String? label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to be greater than or equal to $_required";
    } else {
      return "$_value is required to be greater than or equal to $_required";
    }
  }
}

class NumLessThanRequired implements Exception {
  final num _value;
  final num _required;
  final String? _label;

  NumLessThanRequired({
    required num value,
    required num required,
    String? label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to be less than $_required";
    } else {
      return "$_value is required to be less than $_required";
    }
  }
}

class NumLessThanOrEqualToRequired implements Exception {
  final num _value;
  final num _required;
  final String? _label;

  NumLessThanOrEqualToRequired({
    required num value,
    required num required,
    String? label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to be less than or equal to $_required";
    } else {
      return "$_value is required to be less than or equal to $_required";
    }
  }
}
