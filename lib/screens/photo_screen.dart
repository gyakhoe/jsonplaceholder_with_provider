import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/album.dart';
import 'package:jsonplaceholder_with_provider/data/models/photo.dart';
import 'package:provider/provider.dart';

class PhotoScreen extends StatelessWidget {
  final Album album;
  const PhotoScreen({
    Key key,
    @required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Photo> photos = Provider.of<List<Photo>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: photos != null
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                Photo photo = photos.elementAt(index);
                return Card(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image(
                      image: NetworkImage(photo.thumbnailUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
