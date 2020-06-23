import 'package:flutter/foundation.dart';
import 'package:jsonplaceholder_with_provider/data/models/photo.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/photo_repo.dart';

class PhotoScreenProvider {
  Future<List<Photo>> fetchAllPhotoOfAlbum({@required int albumId}) async {
    List<Photo> albumPhotos =
        await PhotoRepo().fetchAlbumPhotoDetail(albumId: albumId);
    return albumPhotos;
  }
}
