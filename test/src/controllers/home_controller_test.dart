import 'package:app_02/src/controllers/home_controller.dart';
import 'package:app_02/src/home/models/todo_model.dart';
import 'package:app_02/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository{}
main() {

  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);
  test("Preencher todo", () async {

    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel(completed: true, userId: 0, title: '', id: 0)]);
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });

  test("Verificar os estados e dar error", () async {
    when(repository.fetchTodos()).thenThrow(Exception());
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
    
  });
}