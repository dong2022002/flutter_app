import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/post.dart';
import 'package:http/http.dart' as http;

class PostsProvider with ChangeNotifier {
  Future<List<Post>> fetchPost() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      List<Post> posts = (json.decode(reponse.body) as List)
          .map((data) => Post.fromJson(data))
          .toList();
      notifyListeners();
      return posts;
    } else {
      throw Exception('Failed to load');
    }
  }
}
