import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  Future<Map> login(username, password) async {
    try {
      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {'email': username, 'password': password});
      final data = json.decode(response.body);
      return data;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
