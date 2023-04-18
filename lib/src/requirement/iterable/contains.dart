import 'package:require/src/subject.dart';

extension IterableContainingRequirement<T> on Subject<Iterable<T>> {
  Subject<Iterable<T>> contains(T element) {
    if (!value.contains(element)) {
      throw IterableContainingRequired(
        value: value,
        element: element,
        label: label,
      );
    }
    return this;
  }
}

class IterableContainingRequired<T> implements Exception {
  final Iterable _value;
  final T _element;
  final String _label;

  IterableContainingRequired({
    required Iterable value,
    required T element,
    required String label,
  })  : _value = value,
        _element = element,
        _label = label;

  @override
  String toString() {
    final elementString = T is String ? "'$_element'" : "$_element";
    return "$_label($_value) is required to contain $elementString";
  }
}
