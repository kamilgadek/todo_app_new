import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}



class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              size: 30,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/foto1.jpg'),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const _SearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: const Text(
                          'All ToDos',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todoo in todosList)
                        ToDoItem(
                          todo: todoo,
                          onToDoChange: handleToDoChange,
                          deleteFunction: (),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10,
                          spreadRadius: 0.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a new task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 25,
                    right: 20,
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.grey[100],
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: Colors.purple[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  void handleToDoChange (ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    
  }

}


class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[100],
      ),
      child: const TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search'),
      ),
    );
  }
}
