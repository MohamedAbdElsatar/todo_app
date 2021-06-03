import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/screens/add_new_task_screen.dart';
import 'package:todo/screens/tasks_list.dart';
import 'package:todo/widgets/badge.dart';

class OverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      //backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
             padding: EdgeInsets.only(
                top: 50.0, left: 30.0, right: 30.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child:  Consumer<Tasks>(
                  builder: (ctx, task, child) =>Badge(
                     child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.list,
                          size: 35,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      value: task.task.length.toString(),
                      ),
                       
                      )
                ),

               
                Text('Todo',
                    style: TextStyle(
                        fontSize: 50,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w700)),
               
              ],
            ),
          ),
          TasksList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                    child:Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddNewTask(),
                    )
                )
            );
        },
      ),
    );
  }
}
