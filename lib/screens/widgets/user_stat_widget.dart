import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/album.dart';
import 'package:jsonplaceholder_with_provider/data/models/post.dart';
import 'package:jsonplaceholder_with_provider/screens/user_album_screen.dart';
import 'package:jsonplaceholder_with_provider/screens/user_post_screen.dart';
import 'package:provider/provider.dart';

class UserStatWidget extends StatelessWidget {
  final String title;

  const UserStatWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> userlist;
    title == 'Post'
        ? userlist = Provider.of<List<Post>>(context)
        : userlist = Provider.of<List<Album>>(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          title == 'Post'
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserPostScreen(
                            posts: userlist,
                          )))
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserAlbumScreen(
                            albums: userlist,
                          )));
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                userlist != null
                    ? Text(
                        userlist.length.toString(),
                        style: TextStyle(fontSize: 50),
                      )
                    : CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
