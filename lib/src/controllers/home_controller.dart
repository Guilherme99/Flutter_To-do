import 'package:app_02/src/home/models/todo_model.dart';
import 'package:app_02/src/repositories/todo_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController{
  List <TodoModel> todos = [];
  final state = ValueNotifier<HomeState>(HomeState.start);

  final TodoRepository _repository ;

  HomeController([TodoRepository? repository]) : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try{
      todos = await  _repository.fetchTodos();
      state.value = HomeState.success;

    }catch(e){
      state.value = HomeState.error;
    }
    
  }
}

enum HomeState  {start, loading, success, error}