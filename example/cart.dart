import 'package:require/require.dart';

import 'book.dart';

class Cart {
  final List<Book> books;

  Cart({required this.books}) {
    require(books, label: 'books').hasLengthGreaterThan(0);
  }
}

void main() {
  final cart = Cart(books: []);
  print(cart);
}
