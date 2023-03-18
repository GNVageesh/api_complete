import 'dart:convert';

import 'package:api_complete/models/post.model.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class Remote {
  final BASE = "https://jsonplaceholder.typicode.com/posts/";
  final client = http.Client();

  Future<List<Post>> fetchPosts() async {
    final res = await client.get(Uri.parse(BASE));
    if (res.statusCode == 200) {
      return compute(parsePosts, res.body);
    } else {
      throw Exception("Failed to fetch Posts");
    }
  }

  Future<Post> fetchOnePost(int id) async {
    final res = await client.get(Uri.parse(BASE + id.toString()));
    if (res.statusCode == 200) {
      return Post.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed to find this post");
    }
  }

  Future<Post> createPost(String title, String body) async {
    final response = await client.post(
      Uri.parse(BASE),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{'title': title, 'body': body}),
    );

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future<Post> updatePost(String title, String body, int id) async {
    final res = await client.put(
      Uri.parse(BASE + id.toString()),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'body': body,
      }),
    );

    if (res.statusCode == 200) {
      return Post.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed to update the post");
    }
  }
}
