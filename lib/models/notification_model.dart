class NotificationModel {
  final int? notificationId;
  final String title;
  final String body;
  final String creationDate;

  NotificationModel({
    required this.notificationId,
    required this.title,
    required this.body,
    required this.creationDate
});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        notificationId: json['notificationId'],
        title: json['title'],
        body: json['body'],
        creationDate: json['creationDate']
    );
  }

  Map<String, dynamic> toJson() => {
    "notificationId": notificationId,
    "title": title,
    "body": body,
    "creationDate": creationDate
  };

}