import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/post_screen_model.dart';
import 'package:jsonplaceholder_with_provider/screens/widgets/post_widget.dart';

import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PostScreenModel> postScreenModels =
        Provider.of<List<PostScreenModel>>(context);
    return postScreenModels != null
        ? ListView.builder(
            itemCount: postScreenModels.length,
            itemBuilder: (context, index) {
              PostScreenModel postScreenModel =
                  postScreenModels.elementAt(index);
              return PostWidget(
                postScreenModel: postScreenModel,
              );
            })
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
