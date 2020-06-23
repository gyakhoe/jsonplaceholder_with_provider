import 'package:jsonplaceholder_with_provider/common/strings.dart';
import 'package:jsonplaceholder_with_provider/data/models/album.dart';
import 'package:jsonplaceholder_with_provider/data/models/photo.dart';
import 'package:jsonplaceholder_with_provider/data/models/screen/album_screen_model.dart';
import 'package:jsonplaceholder_with_provider/data/models/screen/post_screen_model.dart';
import 'package:jsonplaceholder_with_provider/data/models/user.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/album_repo.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/photo_repo.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/user_repo.dart';

class AlbumScreenProvider {
  Future<List<AlbumScreenModel>> fetchAllAlbumDetails() async {
    List<Album> albums = await AlbumRepo().fetchAllAlbums();
    List<AlbumScreenModel> albumScreenModels = List<AlbumScreenModel>();
    for (Album album in albums) {
      User user = await UserRepo().fetchUserDetail(userId: album.userId);
      Photo photo = await PhotoRepo()
          .fetchPhotoWithCustomUrl(url: '${Strings.photosApiUrl}1/?albumId=1');
      AlbumScreenModel model = AlbumScreenModel(
          album: album,
          name: user.name,
          username: user.username,
          firstPhtotUrl: photo.thumbnailUrl,
          userProfilePhotoUrl:
              Strings.userProfileImages.elementAt(album.userId - 1));

      albumScreenModels.add(model);
    }
    return albumScreenModels;
  }
}
