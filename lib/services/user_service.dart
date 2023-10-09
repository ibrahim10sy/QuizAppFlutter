import 'dart:convert';

import '../constantes.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const baseUserUrl = "${baseUrl}:9000/api/users";

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

  Future<User?> getUser(int userId) async{
    final response = await http.get(Uri.parse('$baseUserUrl/$userId'));

    if(response.statusCode == 200) {
      var responseData = json.decode(response.body);
      User? user = User.fromJson(responseData);
      return user;
    }
    return null;
  }

  Future<User?> createQuiz(User user) async {
    final response = await http.post(
      Uri.parse(baseUserUrl),
      body: json.encode(user),
      headers: {
        // Je m'assure que le type de média est défini sur JSON
        'Content-Type':'application/json'
      },
    );

    if (response.statusCode == 200) {
      print("Success");
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      User createdUser = User.fromJson(responseData);
      return createdUser;
    } else if (response.statusCode == 400) {
      Map<String, dynamic> errorMessage = {};
      // Si le statut de réponse est 400 (Bad Request), il y a une erreur de validation
      var errorResponse = json.decode(response.body);
      if (errorResponse.containsKey('message')) {
        errorMessage['message'] = errorResponse['message'];
      }
      if (errorResponse.containsKey('error')) {
        errorMessage['error'] = errorResponse['error'];
      }
      if (errorResponse.containsKey('status')) {
        errorMessage['status'] = errorResponse['status'];
      }
      print("ERROR: $errorMessage");
    } else {
      print("Unexpected Error");
    }
    return null;
  }


}