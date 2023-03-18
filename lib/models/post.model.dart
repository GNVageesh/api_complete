import 'dart:convert';

class Post {
  final int? userId;
  final int id;
  final String title;
  final String? body;

  const Post({
    this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

List<Post> parsePosts(String res) {
  final parsed = jsonDecode(res).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}
