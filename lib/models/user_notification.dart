import 'package:quiz_app/models/notification_model.dart';
import 'package:quiz_app/models/user.dart';

class UserNotification {
  int userNotificationId;
  NotificationModel notification;
  User user;
  bool read;

  UserNotification({
    required this.userNotificationId,
    required this.notification,
    required this.user,
    required this.read,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) => UserNotification(
    userNotificationId: json["userNotificationId"],
    notification: NotificationModel.fromJson(json["notification"]),
    user: User.fromJson(json["user"]),
    read: json["read"],
  );

  Map<String, dynamic> toJson() => {
    "userNotificationId": userNotificationId,
    "notification": notification.toJson(),
    "user": user.toJson(),
    "read": read,
  };
}