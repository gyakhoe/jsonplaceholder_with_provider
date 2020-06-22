import 'package:jsonplaceholder_with_provider/common/strings.dart';
import 'package:jsonplaceholder_with_provider/data/models/album.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/common_repo.dart';

class AlbumRepo {
  Future<List<Album>> fetchAllAlbums() async {
    var jsonRessponse =
        await CommonRepo.makeHttpRequestForList(url: Strings.albumsApiUrl);
    List<Album> albums = jsonRessponse.map((e) => Album.fromMap(e)).toList();
    return albums;
  }

  Future<List<Album>> fetchUserAlbums({int userId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequestForList(
        url: Strings.albumsApiUrl, appendUrl: '?userId=$userId');
    List<Album> albums = jsonResponse.map((e) => Album.fromMap(e)).toList();
    return albums;
  }

  Future<Album> fetchAlbum({int albumId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequest(
        url: Strings.albumsApiUrl, appendUrl: albumId);
    Album album = Album.fromJson(jsonResponse);
    return album;
  }
}
