import 'package:require/require.dart';

extension NullableNumRequirement on Subject<num?> {
  Subject<num?> isNull() {
    if (value != null) {
      throw NullNumRequired(value: value, label: label);
    }
    return this;
  }

  Subject<num> isNotNull() {
    if (value == null) {
      throw NonNullNumRequired(label: label);
    }
    return Subject(value: value!, label: label);
  }

  Subject<num>? ifNotNull() {
    if (value == null) {
      return null;
    }
    return Subject(value: value!, label: label);
  }
}

extension NumRequirement on Subject<num> {
  Subject<num> equals(num value) {
    if (this.value != value) {
      throw NumEqualityRequired(
        value: this.value,
        required: value,
        label: label,
      );
    }
    return this;
  }

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

class NumEqualityRequired implements Exception {
  final num _value;
  final num _required;
  final String? _label;

  NumEqualityRequired({
    required num value,
    required num required,
    String? label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to be equal to $_required";
    } else {
      return "$_value is required to be equal to $_required";
    }
  }
}

class NullNumRequired implements Exception {
  final num? _value;
  final String? _label;

  NullNumRequired({required num? value, String? label})
      : _value = value,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to be null";
    } else {
      return "'$_value' is required to be null";
    }
  }
}

class NonNullNumRequired implements Exception {
  final String? _label;

  NonNullNumRequired({String? label}) : _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label(null) is required to be non-null";
    } else {
      return "null is required to be non-null";
    }
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
