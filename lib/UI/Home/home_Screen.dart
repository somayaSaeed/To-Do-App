import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/UI/Register_Login/LoginScreen.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';
import '../../Core/Local/DialogUtils.dart';
import '../../Core/Provider/auth user provider.dart';
import '../../Core/Provider/list provider.dart';
import 'Setting Tab/settings_tab.dart';
import 'Task List Tab/AddTaskBottomSheet.dart';
import 'Task List Tab/Task List tab.dart';

class HomeScreen extends StatefulWidget {
  static String routName = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var listProvider = Provider.of<ListProvider>(context);
    var authProvider = Provider.of<AuthUserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 5.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22.0,
                  backgroundImage: AssetImage(
                    'assets/image/sura.png',
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      '${authProvider.currentUser?.name}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    ColorResources.babyBlue,
                    ColorResources.primaryLightColor
                  ]),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {
                  DialogUtils.showMessage(
                      context: context,
                      message: 'Do you want to log out.',

                      posActiveName: 'Yes',
                      negActiveName: 'No',
                      posAction: () {
                        listProvider.tasksList = [];
                        authProvider.currentUser = null;
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routName);
                      },
                      );
                },
                icon: const Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
              ),
            )
          ],
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
          padding: const EdgeInsets.all(0),
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
        body: selectedIndex == 0 ?  TaskListTab() :  SettingsTab());
  }

  void addTaskBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const AddTaskBottomSheet());
  }
}
