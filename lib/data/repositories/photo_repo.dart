import 'package:jsonplaceholder_with_provider/common/strings.dart';
import 'package:jsonplaceholder_with_provider/data/models/photo.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/common_repo.dart';

class PhotoRepo {
  Future<List<Photo>> fetchAllPhotoDetails() async {
    var jsonResponse =
        await CommonRepo.makeHttpRequestForList(url: Strings.photosApiUrl);
    List<Photo> photos = jsonResponse.map((e) => Photo.fromMap(e)).toList();
    return photos;
  }

  Future<List<Photo>> fetchAlbumPhotoDetail({int albumId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequestForList(
        url: Strings.photosApiUrl, appendUrl: '?albumId=$albumId');
    List<Photo> photos = jsonResponse.map((e) => Photo.fromMap(e)).toList();
    return photos;
  }

  Future<Photo> fetchPhoto({int photoId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequest(
        url: Strings.photosApiUrl, appendUrl: photoId);
    Photo photo = Photo.fromJson(jsonResponse);
    return photo;
  }

  Future<Photo> fetchPhotoWithCustomUrl({String url}) async {
    var jsonResponse = await CommonRepo.makeHttpRequest(url: url);
    Photo photo = Photo.fromMap(jsonResponse);
    return photo;
  }
}
