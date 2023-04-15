class Subject<T> {
  final T value;
  final String? label;

  Subject({required this.value, this.label});

  Subject<T> equals(T value) {
    if (this.value != value) {
      throw EqualityRequired(value: this.value, required: value, label: label);
    }
    return this;
  }

  Subject<T> predicate(bool Function(T) function, {required String message}) {
    if (!function(value)) {
      throw PredicateSatisfactionRequired(message);
    }
    return this;
  }
}

extension NullableObjectRequirement<T> on Subject<T?> {
  Subject<T?> isNull() {
    if (value != null) {
      throw NullRequired(value: value, label: label);
    }
    return this;
  }

  Subject<T> isNotNull() {
    if (value == null) {
      throw NonNullRequired(label: label);
    }
    return Subject(value: value as T, label: label);
  }
}

class EqualityRequired<T> implements Exception {
  final T _value;
  final T _required;
  final String? _label;

  EqualityRequired({
    required T value,
    required T required,
    String? label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() {
    final valueString = _value is String ? "'$_value'" : _value;
    final requiredString = _required is String ? "'$_required'" : _required;
    if (_label != null) {
      return "$_label($valueString) is required to be equal to $requiredString";
    } else {
      return "$valueString is required to be equal to $requiredString";
    }
  }
}

class PredicateSatisfactionRequired implements Exception {
  final String _message;

  PredicateSatisfactionRequired(this._message);

  @override
  String toString() {
    return _message;
  }
}

class NullRequired<T> implements Exception {
  final T? _value;
  final String? _label;

  NullRequired({required T? value, String? label})
      : _value = value,
        _label = label;

  @override
  String toString() {
    final valueString = _value is String ? "'$_value'" : _value;
    if (_label != null) {
      return "$_label($valueString) is required to be null";
    } else {
      return "$valueString is required to be null";
    }
  }
}

class NonNullRequired implements Exception {
  final String? _label;

  NonNullRequired({String? label}) : _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label(null) is required to be non-null";
    } else {
      return "null is required to be non-null";
    }
  }
}
