import 'dart:convert';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const baseUserUrl = "http://192.168.137.139:9000/api/users";

  Future<List<User>> getUsers() async{
    final response = await http.get(Uri.parse(baseUserUrl));

    if(response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<User> users = [];
      for (var user in responseData) {
        users.add(User.fromJson(user));
      }
      return users;
    }
   return [];
  }
}