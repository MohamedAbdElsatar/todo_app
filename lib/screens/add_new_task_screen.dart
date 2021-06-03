import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final formKey = GlobalKey<FormState>();

  var task = {'title': '', 'id': ''};

  var genrationId = Random().nextInt(1999914);

  void _saveTask() {

   
    formKey.currentState!.save();
    Provider.of<Tasks>(context, listen: false)
        .addTask(task['title'], task['id']);

    print(task['title']);
    print(task['id']);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Theme.of(context).accentColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Add Task',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Form(
                key: formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return 'Please, enter Task.';
                    }
                  },
                  onSaved: (value) {
                    task['title'] = value.toString();
                    task['id'] = 't${genrationId * 10}';
                  },
                  onFieldSubmitted: (_) => _saveTask(),
                  autofocus: true,
                  decoration: const InputDecoration(labelText: 'add task'),
                  textInputAction: TextInputAction.done,
                  cursorColor: Theme.of(context).primaryColor,
                )),
            TextButton(
              onPressed: () {
                _saveTask();
              },
              child: Text('Add Task',
                  style: TextStyle(color: Theme.of(context).accentColor)),
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  //textStyle: TextStyle(color: Theme.of(context).accentColor)
                  alignment: Alignment.center),
            )
          ],
        ),
      ),
    );
  }
}
