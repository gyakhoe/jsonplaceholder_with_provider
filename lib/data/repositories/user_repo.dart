import 'package:jsonplaceholder_with_provider/common/strings.dart';
import 'package:jsonplaceholder_with_provider/data/models/user.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/common_repo.dart';

class UserRepo {
  Future<List<User>> fetchAllUsers() async {
    var jsonResponse =
        await CommonRepo.makeHttpRequestForList(url: Strings.usersApiUrl);
    List<User> users =
        jsonResponse.map((responseMap) => User.fromMap(responseMap)).toList();
    return users;
  }

  Future<User> fetchUserDetail({int userId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequest(
        url: Strings.usersApiUrl, appendUrl: userId);
    User user = User.fromMap(jsonResponse);
    return user;
  }
}
