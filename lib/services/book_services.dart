import 'dart:async';
import 'package:adopt_app/models/book.dart';
import 'package:adopt_app/services/client.dart';
import "package:dio/dio.dart";

class BookServices {
  Future<List<Book>> getBooks() async {
    List<Book> books = [];
    try {
      Response response = await Client.dio.get('/');
      books =
          (response.data as List).map((book) => Book.fromJson(book)).toList();
    } catch (error) {
      print(error);
    }
    return books;
  }

  Future<Book> createBook({required Book book}) async {
    late Book retrievedBook;
    try {
      FormData data = FormData.fromMap({
        "title": book.title,
        "author": book.author,
        "price": book.price,
        "image": await MultipartFile.fromFile(
          book.image,
        ),
      });
      Response response = await Client.dio.post('/', data: data);
      retrievedBook = Book.fromJson(response.data);
    } catch (error) {
      print(error);
    }
    return retrievedBook;
  }

  Future<Book> updateBook({required Book book}) async {
    late Book retrievedBook;
    try {
      FormData data = FormData.fromMap({
        "title": book.title,
        "author": book.author,
        "price": book.price,
        "image": await MultipartFile.fromFile(
          book.image,
        ),
      });

      Response response = await Client.dio.put('/${book.id}', data: data);
      retrievedBook = Book.fromJson(response.data);
    } catch (error) {
      print(error);
    }
    return retrievedBook;
  }

  Future<void> deleteBook({required int BookId}) async {
    try {
      await Client.dio.delete('/${BookId}');
    } catch (error) {
      print(error);
    }
  }
}
