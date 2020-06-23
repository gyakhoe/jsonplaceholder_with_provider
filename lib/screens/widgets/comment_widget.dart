import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/comment.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;
  const CommentWidget({
    Key key,
    @required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 300,
      margin: EdgeInsets.only(left: 30),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                comment.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                comment.email,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                comment.body,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
