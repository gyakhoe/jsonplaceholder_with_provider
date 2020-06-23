import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/comment.dart';
import 'package:jsonplaceholder_with_provider/data/models/post_screen_model.dart';
import 'package:jsonplaceholder_with_provider/screens/widgets/comment_widget.dart';
import 'package:jsonplaceholder_with_provider/screens/widgets/post_widget.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatelessWidget {
  final PostScreenModel postScreenModel;
  const CommentScreen({Key key, @required this.postScreenModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Comment> comments = Provider.of<List<Comment>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Column(
        children: <Widget>[
          PostWidget(
            postScreenModel: postScreenModel,
            shouldCommentButtonDisable: true,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 169 - 85,
            child: comments != null
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      Comment comment = comments.elementAt(index);
                      return CommentWidget(comment: comment);
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
