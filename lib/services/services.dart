import 'dart:convert';

import 'package:flutter_application_9/models/usersModel.dart';
import 'package:http/http.dart' as http;

class Userservice {
  final String url = "https://reqres.in/api/users?page=2";
  Future<UserModel?> fetchUsers() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var JsonBody = UserModel.fromJson(jsonDecode(res.body));
      return JsonBody;
    } else {
      print("istek basarisiz.");
    }
  }
}
