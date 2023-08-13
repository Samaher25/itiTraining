import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/todo_model.dart';
import 'package:flutter_application_2/service/todo_service.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<TodoModel> todos = [];
  bool isLoading = true;

  getMyTodos() async {
    todos = await TodoService().getTodos();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyTodos();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? 
    Center(
       child: CircularProgressIndicator( ),
       )
    :  ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context,int index) {
        return ListTile(
          title: Text(todos[index].title ?? "--"),
          //subtitle: Text(todos[index].completed ?? "--"),
          trailing: Icon(Icons.person_2_outlined),
          leading: Text("${index + 1}"),
        );
      }, 
    );
  }
}