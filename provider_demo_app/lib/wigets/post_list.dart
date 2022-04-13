import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo_app/models/post.dart';
import 'package:provider_demo_app/providers/posts_provider.dart';
import 'package:provider_demo_app/wigets/post_list_item.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> dataPost = [];
  bool _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<PostsProvider>(context, listen: false)
        .fetchPost()
        .then((value) {
      setState(() {
        dataPost = value;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: dataPost.length,
            itemBuilder: (context, index) {
              return PostListItem(data: dataPost, index: index);
            },
          );
  }
}
