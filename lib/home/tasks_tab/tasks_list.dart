import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/database/myDataBase.dart';
import 'package:to_do/home/tasks_tab/task_widget.dart';

import '../../database/task_data.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date){
            setState(() {
              selectedDate=date;
            });
          },
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.black,
          activeDayColor: Theme.of(context).primaryColorLight,
          activeBackgroundDayColor: Colors.white,
          dotsColor: Theme.of(context).primaryColorLight,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        SizedBox(
          height: 6.0,
        ),
        Expanded(
            child: StreamBuilder<QuerySnapshot<Task>>(
                stream: MyDataBase.listenForTasksRealTimeUpdates(selectedDate),
                builder: (buildContext,snapShot){
                  if(snapShot.hasError){
                    return Text('There is something wrong , please try again later');
                  }else if(snapShot.connectionState==ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    var tasks=snapShot.data?.docs.map((e) => e.data()).toList();
                    return ListView.builder(itemBuilder: (context,index){
                      return TaskWidget(
                          tasks[index]
                      );
                    },itemCount: tasks!.length,
                    );
                  }
                })),
      ],
    );
  }
}
