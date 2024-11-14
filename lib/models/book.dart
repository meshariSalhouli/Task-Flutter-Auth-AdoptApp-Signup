class Book {
  int? id;
  String title;
  String author;
  double price;
  String image;

  Book(
      {this.id,
      required this.title,
      required this.author,
      required this.price,
      required this.image});

  factory Book.fromJson(Map<String, dynamic> json) => Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      price: json['price'],
      image: json['image']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "title": title,
        "author": author,
        "price": price,
        "image": image
      };
}
