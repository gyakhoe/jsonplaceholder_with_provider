import 'package:jsonplaceholder_with_provider/data/models/post.dart';

class PostScreenModel {
  final String name;
  final String username;
  final String photoUrl;
  final Post post;

  PostScreenModel({
    this.name,
    this.username,
    this.photoUrl,
    this.post,
  });
}
