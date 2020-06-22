import 'package:jsonplaceholder_with_provider/common/strings.dart';
import 'package:jsonplaceholder_with_provider/data/models/comment.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/common_repo.dart';

class CommentRepo {
  Future<List<Comment>> fetchAllComments() async {
    var jsonResponse =
        await CommonRepo.makeHttpRequestForList(url: Strings.commentsApiUrl);
    List<Comment> comments =
        jsonResponse.map((e) => Comment.fromMap(e)).toList();
    return comments;
  }

  Future<List<Comment>> fetchPostComment({int postId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequestForList(
        url: Strings.commentsApiUrl, appendUrl: '?postId=$postId');
    List<Comment> comments =
        jsonResponse.map((e) => Comment.fromMap(e)).toList();
    return comments;
  }

  Future<Comment> fetchComment({int commentId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequest(
        url: Strings.albumsApiUrl, appendUrl: commentId);
    Comment comment = Comment.fromJson(jsonResponse);
    return comment;
  }
}
