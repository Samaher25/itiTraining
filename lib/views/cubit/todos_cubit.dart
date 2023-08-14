import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/todo_model.dart';
import 'package:flutter_application_2/service/todo_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial()){
    getMyTodos();
  }
    
     List<TodoModel> todos = [];
     getMyTodos() async {
      try{
      emit(TodosLoading());
      todos = await TodoService().getTodos();
      emit(TodosSuccess()); 
      } catch(e) {
      emit(TodosError());
      }
  }

  
}
