import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/album.dart';

class UserAlbumScreen extends StatelessWidget {
  final List<Album> albums;
  const UserAlbumScreen({
    Key key,
    @required this.albums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, index) {
            Album album = albums.elementAt(index);
            return Card(
              child: ListTile(
                title: Text(album.title),
              ),
            );
          }),
    );
  }
}
