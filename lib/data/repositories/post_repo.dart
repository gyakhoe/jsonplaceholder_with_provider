import 'package:jsonplaceholder_with_provider/common/strings.dart';
import 'package:jsonplaceholder_with_provider/data/models/post.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/common_repo.dart';

class PostRepo {
  Future<List<Post>> fetchAllPost() async {
    var jsonReponse =
        await CommonRepo.makeHttpRequestForList(url: Strings.postsApiUrl);
    List<Post> posts = jsonReponse.map((e) => Post.fromMap(e)).toList();
    return posts;
  }

  Future<List<Post>> fetchUserPost({int userId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequestForList(
        url: Strings.postsApiUrl, appendUrl: '?userId=$userId');
    List<Post> posts = jsonResponse.map((e) => Post.fromMap(e)).toList();
    return posts;
  }

  Future<Post> fetchPost({int postId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequest(
        url: Strings.postsApiUrl, appendUrl: postId);
    Post post = Post.fromJson(jsonResponse);
    return post;
  }
}
