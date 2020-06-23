import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/screen/album_screen_model.dart';
import 'package:jsonplaceholder_with_provider/screens/widgets/album_widget.dart';
import 'package:provider/provider.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AlbumScreenModel> albumScreenModels =
        Provider.of<List<AlbumScreenModel>>(context);
    return albumScreenModels != null
        ? GridView.builder(
            itemCount: albumScreenModels.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              AlbumScreenModel albumScreenModel =
                  albumScreenModels.elementAt(index);
              return AlbumWidget(
                albumScreenModel: albumScreenModel,
              );
            })
        : CircularProgressIndicator();
  }
}
