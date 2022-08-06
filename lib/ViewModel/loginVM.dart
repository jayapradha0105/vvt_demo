import 'package:flutter/material.dart';
import 'package:vvt_demo/Services/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vvt_demo/View/dashboard.dart';

class LoginVM extends ChangeNotifier {
  BuildContext context;
  TextEditingController uncontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  FocusNode unNode = FocusNode();
  FocusNode pwdNode = FocusNode();

  bool obscure = true;
  bool isLoading = false;

  String errmsg = "";
  Map loginRes = {};

  LoginVM(this.context);

  void setObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  loginCheck() async {
    isLoading = true;
    errmsg = "Loading";
    notifyListeners();
    try {
      loginRes =
          await LoginService().login(uncontroller.text, pwdcontroller.text);
      print(loginRes);

      if (loginRes['token'] != null) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString('token', loginRes['token']);
        errmsg = "";
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ));
      } else {
        errmsg = loginRes['error'];
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
