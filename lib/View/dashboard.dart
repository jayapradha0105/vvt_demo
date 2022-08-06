import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vvt_demo/View/analytics.dart';
import 'package:vvt_demo/View/login.dart';
import 'package:vvt_demo/ViewModel/userListVM.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserListVM>(
        create: (BuildContext context) => UserListVM(context),
        child: Consumer<UserListVM>(builder: (context, vm, _) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Dashboard"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ))
                ],
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 95),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Menu',
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.white)),
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        )),
                    ListTile(
                      title: Text('Analytics', style: TextStyle(fontSize: 19)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Analytics(),
                            ));
                      },
                    ),
                  ],
                ),
              ),
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  child: vm.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.black,
                        ))
                      : vm.userList.length == 0
                          ? Center(child: Text("No data found"))
                          : ListView.builder(
                              itemCount: vm.userList.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    margin: EdgeInsets.only(
                                        top: index == 0 ? 30 : 5,
                                        bottom: 15,
                                        left: 20,
                                        right: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          new BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 5.0,
                                          ),
                                        ]),
                                    child: Row(children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            vm.userList[index].avatar ?? ""),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${vm.userList[index].firstName ?? ''} ${vm.userList[index].lastName ?? ''}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                                // fontFamily: font,
                                                color: Colors.black),
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            vm.userList[index].email ?? "",
                                            style: TextStyle(
                                                fontSize: 15,
                                                // fontFamily: font,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]));
                              })));
        }));
  }
}
