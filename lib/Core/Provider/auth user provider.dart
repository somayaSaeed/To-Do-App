import 'package:flutter/cupertino.dart';
import 'package:to_do_app/Core/Model/user%20model.dart';

class AuthUserProvider extends ChangeNotifier {
  ///data
  MyUser? currentUser;
  void updateUser(MyUser newUser) {
    currentUser = newUser;
    notifyListeners();
  }
}
