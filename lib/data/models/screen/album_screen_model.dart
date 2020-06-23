import 'package:flutter/foundation.dart';
import 'package:jsonplaceholder_with_provider/data/models/album.dart';

class AlbumScreenModel {
  final String userProfilePhotoUrl;
  final String name;
  final String username;
  final Album album;
  final String firstPhtotUrl;

  AlbumScreenModel({
    @required this.userProfilePhotoUrl,
    @required this.name,
    @required this.username,
    @required this.album,
    @required this.firstPhtotUrl,
  });
}
