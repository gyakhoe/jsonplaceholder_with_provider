import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/screen/album_screen_model.dart';
import 'package:jsonplaceholder_with_provider/provider/photo_screen_provider.dart';
import 'package:jsonplaceholder_with_provider/screens/photo_screen.dart';
import 'package:provider/provider.dart';

class AlbumWidget extends StatelessWidget {
  final AlbumScreenModel albumScreenModel;
  const AlbumWidget({
    Key key,
    @required this.albumScreenModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FutureProvider(
              create: (context) => PhotoScreenProvider()
                  .fetchAllPhotoOfAlbum(albumId: albumScreenModel.album.id),
              child: PhotoScreen(album: albumScreenModel.album),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 7,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(albumScreenModel.firstPhtotUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(albumScreenModel.userProfilePhotoUrl),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(children: [
                          TextSpan(
                            text: albumScreenModel.album.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '\n${albumScreenModel.name}',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          TextSpan(
                            text: '\n@${albumScreenModel.username}',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
