import 'package:require/require.dart';

import 'book.dart';
import 'isbn.dart';
import 'price.dart';

class Cart {
  final List<Book> books;

  Cart({required this.books}) {
    require(books, label: 'books').isNotEmpty().hasLengthLessThan(10);
  }
}

void main() {
  final book = Book(isbn: ISBN('ISBN978-4-000-000'), price: Price(10));
  final cart = Cart(books: [book]);
  print(cart);
}
