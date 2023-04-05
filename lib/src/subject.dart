class Subject<T> {
  final T value;
  final String? label;

  Subject({required this.value, this.label});

  Subject<T> predicate(bool Function(T) function, {required String message}) {
    if (!function(value)) {
      throw PredicateSatisfactionRequired(message);
    }
    return this;
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
