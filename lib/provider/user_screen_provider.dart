import 'package:jsonplaceholder_with_provider/data/models/user.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/user_repo.dart';

class UserScreenProvider {
  Future<List<User>> fetchAllUserDetails() async {
    List<User> users = await UserRepo().fetchAllUsers();
    return users;
  }
}
