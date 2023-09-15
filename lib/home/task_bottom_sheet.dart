import 'package:flutter/material.dart';
import 'package:to_do/database/myDataBase.dart';
import 'package:to_do/database/task_data.dart';
import 'package:to_do/home/showMessage.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: titleController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please enter title of task';
                }
                return null;
              },
              maxLines: 1,
              minLines: 1,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: descController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please enter description of task';
                }
                return null;
              },
              maxLines: 3,
              minLines: 3,
              decoration: InputDecoration(
                hintText: 'Description',
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Select date',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
                onTap: () {
                  showDateDialoge();
                },
                child: Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}')),
            SizedBox(
              height: 18,
            ),
            ElevatedButton(
                onPressed: () {
                  addTask();
                },
                child: Text(
                  'Add',
                ))
          ],
        ),
      ),
    );
  }

  var selectedDate = DateTime.now();
  void showDateDialoge() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      String title = titleController.text;
      String description = descController.text;
      Task task = Task(
          title: title,
          description: description,
          dataTime: selectedDate,
          isDone: false);
      MyDataBase?.insertTask(task).then((value) {
        showMessage(context, 'Task Added Successfully', positiveAction: () {});
      }).onError((error, stackTrace) {
        showMessage(context, 'something went wrong , try again later', positiveAction: () {});
      }).timeout(Duration(seconds: 5), onTimeout: () {
        showMessage(context, 'Task Saved Locally', positiveAction: () {});
      });
    }
  }
}
