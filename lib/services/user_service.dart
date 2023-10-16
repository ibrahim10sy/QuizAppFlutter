import 'dart:convert';
import 'package:quiz_app/models/user_notification.dart';
import '../constantes.dart';
import '../models/notification_model.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;


class UserService {
  static const baseUserUrl = "$baseUrl:9000/api/users";

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

  Future<User?> createUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUserUrl),
      body: json.encode(user),
      headers: {
        // Je m'assure que le type de média est défini sur JSON
        'Content-Type':'application/json'
      },
    );

    if (response.statusCode == 200) {
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

  Future<List<UserNotification>> getNotificationsForUser(int userId) async {
    final response = await http.get(Uri.parse("$baseUserUrl/$userId/usernotifications"));
    if(response.statusCode == 200) {
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      List<UserNotification> userNotifications = [];
      for (var notification in responseData) {
        userNotifications.add(UserNotification.fromJson(notification));
      }
      return userNotifications;
    }
    return [];
  }

  Future<List<NotificationModel>> getNotificationsUnReadByUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUserUrl/$userId/notifications/unread'));
    if(response.statusCode == 200) {
      final responseData = json.decode(utf8.decode(response.bodyBytes));
      List<NotificationModel> notificationsUnread = [];
      for(var notification in responseData){
        notificationsUnread.add(NotificationModel.fromJson(notification));
      }
      return notificationsUnread;
    }
    return [];
  }

  Future<NotificationModel?> getOneNotificationForUser(int userId, int notificationId) async{
    final response = await http.get(Uri.parse("$baseUserUrl/$userId/notifications/$notificationId"));

    if(response.statusCode == 200) {
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      NotificationModel? notification = NotificationModel.fromJson(responseData);
      return notification;
    }
    return null;
  }

  Future<int> getNbNotificationUnreadByUser(int userId) async {
    List<NotificationModel> userNotifications = await getNotificationsUnReadByUser(userId);
    return userNotifications.length;
  }

  void confirmNotificationRead(int userId, int notificationId) async {
    final response = await http.get(Uri.parse("$baseUserUrl/$userId/notifications/$notificationId/read"));
    if(response.statusCode != 200){
      print(response.body);
    }
  }

  Future<UserNotification?> deleteNotificationForUser(int userId, int notificationId) async{
    final response = await http.delete(Uri.parse("$baseUserUrl/$userId/notifications/$notificationId"));
    if(response.statusCode == 200) {
      final responseDate = json.decode(utf8.decode(response.bodyBytes));
      UserNotification userNotification = UserNotification.fromJson(responseDate);
      return userNotification;
    }
    print(response.statusCode);
    return null;
  }

  Future<List<User>> getFollowings(int userId) async {
    final response = await http.get(Uri.parse("$baseUserUrl/$userId/followings"));
    if(response.statusCode == 200) {
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      List<User> users = [];
      for (var user in responseData) {
        users.add(User.fromJson(user));
      }
      return users;
    }
    return [];
  }

  Future<List<User>> getFollowers(int userId) async {
    final response = await http.get(Uri.parse("$baseUserUrl/$userId/followers"));
    if(response.statusCode == 200) {
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      List<User> users = [];
      for (var user in responseData) {
        users.add(User.fromJson(user));
      }
      return users;
    }
    return [];
  }

  Future<String> followAnUser(int followerId, int userSecondId) async {
    final response = await http.get(Uri.parse("$baseUserUrl/$followerId/follow/$userSecondId"));
    if(response.statusCode == 200){
      return "OK";
    }
    return "error";
  }

  Future<String> unFollowAnUser(int followerId, int userSecondId) async {
    final response = await http.get(Uri.parse("$baseUserUrl/$followerId/unfollow/$userSecondId"));
    if(response.statusCode == 200){
      return "OK";
    }
    return "error";
  }

}