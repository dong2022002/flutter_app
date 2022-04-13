import 'package:flutter/material.dart';
import 'package:provider_demo_app/models/comment.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({
    required this.data,
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;
  final List<Comment> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        padding: const EdgeInsets.all(24),
        // margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 94, 166, 233),
            border: Border.all(color: Colors.black45, width: 2),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, offset: Offset(3, 6), blurRadius: 6),
            ]),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
              child: Text(
                '${data[index].name}',
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 4, 16, 68),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${data[index].body}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black38,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            )
          ],
        ),
      ),
    );
  }
}
