import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/common/strings.dart';

import 'package:jsonplaceholder_with_provider/data/models/user.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/album_repo.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/post_repo.dart';
import 'package:jsonplaceholder_with_provider/screens/widgets/user_additional_detail_horizontal_widget.dart';
import 'package:jsonplaceholder_with_provider/screens/widgets/user_additional_detail_widget.dart';
import 'package:jsonplaceholder_with_provider/screens/widgets/user_stat_widget.dart';
import 'package:provider/provider.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;
  const UserDetailScreen({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(Strings.userProfileImages
                                  .elementAt(user.id - 1)),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Name:  ${user.name}'),
                              Text('username:  ${user.username}'),
                              Text('Email: ${user.email}'),
                              Text('Phone: ${user.phone}'),
                              Text('web:   ${user.website}'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              UserAdditionalDetail(
                title: 'Address',
                children: <Widget>[
                  Text('Street  : ${user.address.street}'),
                  Text('Suite   : ${user.address.suite}'),
                  Text('city    : ${user.address.city}'),
                  Text('zipCode : ${user.address.zipcode}'),
                  Text(
                      'Geo      : lat: ${user.address.geo.lat}, long: ${user.address.geo.lng}'),
                ],
              ),
              UserAdditionalDetail(
                title: 'Company',
                children: <Widget>[
                  Text('name  : ${user.company.name}'),
                  Text('Catch Phrase   : ${user.company.catchPhrase}'),
                  Text('bs    : ${user.company.bs}'),
                ],
              ),
              UserAdditionalDetailHorizontalWidget(
                children: <Widget>[
                  FutureProvider(
                    create: (context) =>
                        PostRepo().fetchUserPost(userId: user.id),
                    child: UserStatWidget(
                      title: 'Post',
                    ),
                  ),
                  FutureProvider(
                    create: (context) =>
                        AlbumRepo().fetchUserAlbums(userId: user.id),
                    child: UserStatWidget(
                      title: 'Album',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
