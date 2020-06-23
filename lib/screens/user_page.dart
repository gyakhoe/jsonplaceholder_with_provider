import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/data/models/user.dart';
import 'package:jsonplaceholder_with_provider/screens/widgets/user_widget.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<List<User>>(context);
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: users != null
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  User user = users.elementAt(index);

                  return UserWdiget(user: user);
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
