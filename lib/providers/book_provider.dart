import 'package:adopt_app/models/book.dart';
import 'package:adopt_app/services/book_services.dart';

import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  List<Book> books = [];

  Future<void> getBooks() async {
    books = await BookServices().getBooks();
  }

  void createBook(Book book) async {
    Book newBook = await BookServices().createBook(book: book);
    books.insert(0, newBook);
    notifyListeners();
  }

  void updateBook(Book book) async {
    Book newBook = await BookServices().updateBook(book: book);
    int index = books.indexWhere((book) => book.id == newBook.id);
    books[index] = newBook;
    notifyListeners();
  }

  void deleteBook(int bookId) async {
    await BookServices().deleteBook(BookId: bookId);
    books.removeWhere((book) => book.id == bookId);
    notifyListeners();
  }
}
