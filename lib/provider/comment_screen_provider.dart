import 'package:flutter/foundation.dart';
import 'package:jsonplaceholder_with_provider/data/models/comment.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/comment_repo.dart';

class CommentScreenProvider {
  Future<List<Comment>> fetchPostComments({@required int postId}) async {
    List<Comment> comments =
        await CommentRepo().fetchPostComment(postId: postId);
    return comments;
  }
}
