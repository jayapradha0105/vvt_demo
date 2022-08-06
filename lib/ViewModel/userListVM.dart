import 'package:flutter/material.dart';
import 'package:vvt_demo/Model/user.dart';
import 'package:vvt_demo/Services/userService.dart';

class UserListVM extends ChangeNotifier {
  BuildContext context;
  bool isLoading = false;
  List<User> userList = [];
 

  UserListVM(this.context){
    getUserList();
  }

  Future<void> getUserList() async {
    isLoading = true;
    userList = await UserService().getUserList();
    isLoading = false;
    notifyListeners();
  }

 
 
}
