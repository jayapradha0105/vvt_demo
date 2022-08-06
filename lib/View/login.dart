import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vvt_demo/ViewModel/loginVM.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<LoginVM>(
        create: (BuildContext context) => LoginVM(context),
        child: Consumer<LoginVM>(builder: (context, vm, _) {
          return Scaffold(
            body: Container(
              height: size.height,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("VVT Demo",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 50),
                  Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.only(bottom: 35),
                      child: TextField(
                        controller: vm.uncontroller,
                        focusNode: vm.unNode,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            hintText: "Enter email",
                            hintStyle:
                                TextStyle(fontSize: 16, color: Colors.grey),
                            border: InputBorder.none),
                      )),
                  Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.only(bottom: 50),
                      child: TextField(
                        controller: vm.pwdcontroller,
                        focusNode: vm.pwdNode,
                        keyboardType: TextInputType.text,
                        obscureText: vm.obscure,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            hintText: "Enter password",
                            hintStyle:
                                TextStyle(fontSize: 16, color: Colors.grey),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                vm.obscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () => vm.setObscure(),
                            )),
                      )),
                  Text(vm.errmsg,
                      style: TextStyle(fontSize: 15, color: Colors.red)),
                  SizedBox(height: 10),
                  GestureDetector(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                      onTap: () => vm.loginCheck()),
                ],
              ),
            ),
          );
        }));
  }
}
