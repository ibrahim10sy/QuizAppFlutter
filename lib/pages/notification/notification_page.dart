import 'package:flutter/material.dart';
import 'package:quiz_app/models/user_notification.dart';
import '../../constantes.dart';
import '../../models/notification_model.dart';
import '../../services/user_service.dart';
import '../../widgets/notification_bubble.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key,}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<int> selectedNotificationIndex = [];
  List<int> notificationsRead = [];
  bool isExpanded = false;
  Function(bool)? trueFunc;
  Function(bool)? falseFunc;

  UserService userService = UserService();
  late Future<List<UserNotification>?> futureUserNotifications;
  List<NotificationModel> userNotifications = [];
  int currentUserId = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUserNotifications = userService.getNotificationsForUser(currentUserId);
  }


  void onTapExpanded(bool value, int notificationIndex){
    setState(() {
      if(!notificationsRead.contains(notificationIndex)){
        notificationsRead.add(notificationIndex);
      }
      isExpanded = value;
      if(selectedNotificationIndex.contains(notificationIndex) && !isExpanded){
        selectedNotificationIndex.remove(notificationIndex);
      }
      else if (!selectedNotificationIndex.contains(notificationIndex) && isExpanded){
        selectedNotificationIndex.add(notificationIndex);
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,),
        child: FutureBuilder(
          future: futureUserNotifications,
          builder: (context, snapshot){
            return ListView.builder(
              itemCount: (snapshot.hasData)? snapshot.data?.length: 0,
              itemBuilder: (context, index){
                if(snapshot.hasData){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NotificationBubble(
                      onCloseButtonPressed: () {},
                      notificationType: NotificationType.newQuiz,
                      onExpansionChanged: (value){
                        onTapExpanded(value, index);
                      },
                      isSelected: selectedNotificationIndex.contains(index),
                      title: (snapshot.data![index].read)?snapshot.data![index].notification.title:snapshot.data![index].notification.title+' (New)',
                      content: snapshot.data![index].notification.body,
                      isRead: snapshot.data![index].read,
                    ),
                  );
                }
                else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            );
          },
        ),
      ),
    );
  }
}