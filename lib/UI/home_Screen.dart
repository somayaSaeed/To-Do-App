import 'package:flutter/material.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';
import 'Home/Setting Tab/settings_tab.dart';
import 'Home/Task List Tab/AddTaskBottomSheet.dart';
import 'Home/Task List Tab/Task List tab.dart';

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
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0 , left: 5.0),
          child: Row(
            children: [
            CircleAvatar(
            radius: 22.0,
            backgroundImage: AssetImage(
                'assets/image/sura.png',
            ),),
              SizedBox(width: 15,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Hello',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Somaya Saeed',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              )

            ],
          ),
        ), flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[ColorResources.babyBlue, ColorResources.primaryLightColor]),
        ),
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

