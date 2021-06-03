import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String id;
  final TaskItem taskItem;

  TaskTile(this.title, this.id, this.taskItem);

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<Tasks>(context, listen: false);
    var isChecked = taskItem.isDone;
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        print(id);
        taskData.removeTask(id);
      },
      background: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).accentColor,
          size: 36,
        ),
      ),
      
        child: Container(
          margin: EdgeInsets.only(bottom: 10,left: 10,right: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ListTile(
            title:(
              Text(
                title,style: TextStyle(fontSize: 18, color: Colors.black,
                  decoration: isChecked? TextDecoration.lineThrough: null
                 ),
              )
            ),
            trailing: IconButton(
                onPressed: () {
                  taskData.updateTask(taskItem);
                },
                icon: Icon(
                isChecked? Icons.check_box:  Icons.check_box_outline_blank,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ),
    );
  }
}
