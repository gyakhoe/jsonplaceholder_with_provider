import 'package:jsonplaceholder_with_provider/common/strings.dart';
import 'package:jsonplaceholder_with_provider/data/models/todo.dart';
import 'package:jsonplaceholder_with_provider/data/repositories/common_repo.dart';

class ToDoRepo {
  Future<List<Todo>> fetchAllTodos() async {
    var jsonResponse =
        await CommonRepo.makeHttpRequestForList(url: Strings.todosApiUrl);
    List<Todo> todos = jsonResponse.map((map) => Todo.fromMap(map)).toList();
    return todos;
  }

  Future<List<Todo>> fetchUserTodos({int userId}) async {
    var jsonReponse = await CommonRepo.makeHttpRequestForList(
        url: Strings.todosApiUrl, appendUrl: 'userId=$userId');
    List<Todo> todos = jsonReponse.map((e) => Todo.fromMap(e)).toList();
    return todos;
  }

  Future<Todo> fetchTodo({int todoId}) async {
    var jsonResponse = await CommonRepo.makeHttpRequest(
        url: Strings.todosApiUrl, appendUrl: todoId);
    Todo todo = Todo.fromJson(jsonResponse);
    return todo;
  }
}
