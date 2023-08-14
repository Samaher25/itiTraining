import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/todo_model.dart';

class TodoService {
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<TodoModel>> getTodos() async {
    List<TodoModel> todosList =  [];
    final response = await Dio().get(url);
    var data = response.data;
    data.forEach((element) {
      TodoModel todo = TodoModel.fromJson(element);
      todosList.add(todo);
    });
    return todosList;
  }
}