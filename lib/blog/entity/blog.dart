class Blog
{
  String? id;
  String? title;
  String? body;
  String? image;
  String? author;
  String? avatar;
  String? date;
  Blog({ this.id, this.title, this.body, this.image, this.author, this.avatar, this.date });
  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
    id: json['id'],
    title: json['title'],
    body: json['body'],
    image: json['image'],
    author: json['author'],
    avatar: json['avatar'],
    date: json['date']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'image': image,
    'author': author,
    'avatar': avatar,
    'date': date
  };
}