import 'package:flutter/material.dart';
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
  late Future<List<NotificationModel>?> futureNotifications;
  List<NotificationModel> notifications = [];
  int currentUserId = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureNotifications = userService.getNotificationsForUser(currentUserId);
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
          future: futureNotifications,
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
                      title: snapshot.data![index].title,
                      content: snapshot.data![index].body,
                      isRead: notificationsRead.contains(index),
                    ),
                  );
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }
              },
            );
          },
        ),
      ),
    );
  }
}