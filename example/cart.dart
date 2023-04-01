import 'package:require/require.dart';

import 'book.dart';

class Cart {
  final List<Book> books;

  Cart({required this.books}) {
    require(books).isNotEmpty();
  }
}

void main() {
  final cart = Cart(books: []);
  print(cart);
}
