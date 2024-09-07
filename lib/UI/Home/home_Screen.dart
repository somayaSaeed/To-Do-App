import 'package:flutter/material.dart';
import 'package:to_do_app/UI/Home/Setting/settings_tab.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';
import 'Task List/AddTaskBottomSheet.dart';
import 'Task List/Task List.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: height * 0.17,
        title: Text(
          'To Do List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskBottomSheet();
        },
        child: Icon(
          Icons.add,
          color: ColorResources.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: ColorResources.white,
        height: height * .08,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        padding: EdgeInsets.all(0),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
      body: selectedIndex==0 ? TaskListTab() : SettingsTab()

    );
  }
  void addTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => AddTaskBottomSheet()
    );
  }

}

