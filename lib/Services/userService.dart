import 'dart:convert';
import 'package:vvt_demo/Model/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<User>> getUserList() async {
    try {
      final response = await http
          .get(Uri.parse("https://reqres.in/api/users?page=2"));
      final data = json.decode(response.body);
      List<User> userList = [];
      userList = data['data']
          .map((tagJson) => User.fromJson(tagJson))
          .cast<User>()
          .toList();
      return userList;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}