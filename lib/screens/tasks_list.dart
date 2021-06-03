import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<Tasks>(context);
     var listLength = taskData.task.length;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Theme.of(context).accentColor,
        ),
        child: 
             listLength >0 ?ListView.builder(
              itemCount: taskData.task.length,
              itemBuilder: (context, index) =>
                  TaskTile(taskData.task[index].title, taskData.task[index].id,taskData.task[index])
            )  : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list, size: 30, color: Colors.grey),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'No Tasks Yet, Please Add some Tasks',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                )),
       
      
    );
  }
}
