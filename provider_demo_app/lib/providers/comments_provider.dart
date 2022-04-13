import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_demo_app/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentsProvider with ChangeNotifier {
  Future<List<Comment>> fetchPost() async {
    const url = 'https://jsonplaceholder.typicode.com/comments';
    final reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      List<Comment> comments = (json.decode(reponse.body) as List)
          .map((data) => Comment.fromJson(data))
          .toList();
      notifyListeners();
      return comments;
    } else {
      throw Exception('Failed to load');
    }
  }
}
