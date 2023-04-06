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
