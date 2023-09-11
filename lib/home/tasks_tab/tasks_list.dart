import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/home/tasks_tab/task_widget.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => {},
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
            child: ListView.builder(
              itemBuilder: (context, index) {
              return TaskWidget();
           },
          itemCount: 32,
        ))
      ],
    );
  }
}
