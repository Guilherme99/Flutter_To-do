import 'package:app_02/src/home/models/todo_model.dart';
import 'package:dio/dio.dart';

class TodoRepository{
  late Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos/';

  TodoRepository([Dio? client]) : dio = client ?? Dio();
  
  Future< List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}