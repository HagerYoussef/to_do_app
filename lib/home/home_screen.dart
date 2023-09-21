import 'package:flutter/material.dart';
import 'package:to_do/home/settings_tab/settings_tab.dart';
import 'package:to_do/home/task_bottom_sheet.dart';
import 'package:to_do/home/tasks_tab/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List',style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blueAccent,
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height*0.11,
        color: Colors.white,
        elevation: 0,
        notchMargin: 6.0,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          iconSize: 35.0,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: '')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          showTaskBottomSheet();
        },
        child: Icon(Icons.add,color: Colors.white,),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(100)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }
  void showTaskBottomSheet(){
    showModalBottomSheet(
        context: context, builder: (context){
      return TaskBottomSheet();
    }
    );
  }
  var tabs = [TasksList(), SettingsList()];
}
