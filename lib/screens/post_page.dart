import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/post_screen_model.dart';
import 'package:jsonplaceholder_with_provider/provider/post_screen_provider.dart';

import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostScreenProvider postScreenProvider =
        Provider.of<PostScreenProvider>(context);
    return FutureBuilder(
      future: postScreenProvider.fetchPostScreenDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PostScreenModel> postScreenModels = snapshot.data;

          return ListView.builder(
              itemCount: postScreenModels.length,
              itemBuilder: (context, index) {
                PostScreenModel postScreenModel =
                    postScreenModels.elementAt(index);
                return Card(
                  elevation: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(postScreenModel.photoUrl),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5, left: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: postScreenModel.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: ' @${postScreenModel.username}',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 78,
                            padding: EdgeInsets.only(top: 5, left: 5),
                            child: Text(
                              postScreenModel.post.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, left: 5),
                            width: MediaQuery.of(context).size.width - 78,
                            child: Text(
                              postScreenModel.post.body,
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width - 78,
                              child: Center(
                                child: Text(
                                  'Commnets',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
