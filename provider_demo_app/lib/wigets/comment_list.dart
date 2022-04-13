import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo_app/models/comment.dart';
import 'package:provider_demo_app/providers/comments_provider.dart';
import 'package:provider_demo_app/wigets/comment_list_item.dart';

class CommentList extends StatefulWidget {
  const CommentList({Key? key}) : super(key: key);

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  List<Comment> dataComment = [];
  bool _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<CommentsProvider>(context, listen: false)
        .fetchPost()
        .then((value) {
      setState(() {
        dataComment = value;
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
            // scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            itemCount: dataComment.length,
            itemBuilder: (context, index) {
              return CommentListItem(data: dataComment, index: index);
            },
          );
  }
}
