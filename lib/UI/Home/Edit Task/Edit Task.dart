import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../Core/Local/DialogUtils.dart';
import '../../../Core/Local/firebase_utlis.dart';
import '../../../Core/Model/task_model.dart';
import '../../../Core/Provider/auth user provider.dart';
import '../../../Core/Provider/list provider.dart';
import '../../../Utils/Color Resources/Color_Resources.dart';
import '../../../Utils/Custom Button.dart';
import '../../Register_Login/LoginScreen.dart';

class EditScreen extends StatefulWidget {
  static String routName = 'edit_screen';

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  late Task task;

  @override
  Widget build(BuildContext context) {
    task = ModalRoute.of(context)!.settings.arguments as Task;

    var listProvider = Provider.of<ListProvider>(context);
    var authProvider = Provider.of<AuthUserProvider>(context);
    titleController.text = task.title;
    desController.text = task.description;
    selectedDate = task.dateTime;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    ColorResources.babyBlue,
                    ColorResources.primaryLightColor
                  ]),
            ),
            height: height * 0.13,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  height: height*.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorResources.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      children: [
                        Text(
                          'Edit Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: ColorResources.babyBlue,
                          ),
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        TextFormField(
                          controller: titleController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          maxLines: 4,
                          controller: desController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('Select Date'),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            showCalender();
                          },
                          child: Text(
                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Spacer(flex: 1,),
                        customBottom(
                          onTap: () {
                            editTask();
                          },
                          text: 'Save Changes',
                          bgColor1: ColorResources.babyBlue,
                          bgColor2: ColorResources.primaryLightColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (chosenDate != null) {
      setState(() {
        selectedDate = chosenDate;
      });
    }
  }

  void editTask() {
    if (formKey.currentState?.validate() == true) {
      task.title = titleController.text;
      task.description = desController.text;
      task.dateTime = selectedDate;

      var authProvider = Provider.of<AuthUserProvider>(context, listen: false);

      FirebaseUtils.editTask(task, authProvider.currentUser!.id ?? '')
          .then((value) {
        Fluttertoast.showToast(
          msg: "Task updated successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black26,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Navigator.pop(context);

        Provider.of<ListProvider>(context, listen: false)
            .getAllTasksFromFireStore(authProvider.currentUser!.id!);
      }).catchError((error) {
        DialogUtils.showMessage(
          context: context,
          title: "Error",
          message: "Failed to update task: $error",
          posActiveName: 'Ok',
        );
      });
    }
  }
}
