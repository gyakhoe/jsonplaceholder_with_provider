import 'package:jsonplaceholder_with_provider/common/strings.dart';
import 'package:jsonplaceholder_with_provider/data/models/post.dart';
import 'package:jsonplaceholder_with_provider/data/models/screen/post_screen_model.dart';

import 'package:jsonplaceholder_with_provider/data/models/user.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/post_repo.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/user_repo.dart';

class PostScreenProvider {
  Future<List<PostScreenModel>> fetchPostScreenDetails() async {
    PostRepo postRepo = PostRepo();
    List<Post> posts = await postRepo.fetchAllPost();
    List<PostScreenModel> postScreenModels = List<PostScreenModel>();
    for (Post post in posts) {
      UserRepo userRepo = UserRepo();
      User user = await userRepo.fetchUserDetail(userId: post.userId);
      PostScreenModel postScreenModel = PostScreenModel(
          post: post,
          name: user.name,
          username: user.username,
          photoUrl: Strings.userProfileImages.elementAt(post.userId - 1));
      postScreenModels.add(postScreenModel);
    }
    return postScreenModels;
  }
}
