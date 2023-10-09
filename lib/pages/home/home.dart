import 'package:flutter/material.dart';
import 'package:quiz_app/models/notification_model.dart';
import 'package:quiz_app/pages/home/body.dart';
import 'package:quiz_app/pages/home/widgets/app_bar_title.dart';
import 'package:quiz_app/pages/notification/notification_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:quiz_app/services/user_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int nbNotification = 0;
  UserService userService = UserService();
  int nbNotificationUnread = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getNbNotificationsUnread().then((int result) {
      setState(() {
        nbNotificationUnread = result;
      });
    });
  }

  Future<int> getNbNotificationsUnread() async {
    int nb = await userService.getNbNotificationUnreadByUser(1);
    return nb;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: [
          badges.Badge(
              position: badges.BadgePosition.topEnd(top: 3, end: 8),
              badgeStyle: const badges.BadgeStyle(
                  padding: EdgeInsets.all(5)
              ),
              badgeContent: Text('$nbNotificationUnread', style: const TextStyle(color: Colors.white),),
              child: IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>NotificationPage()
                        )
                    );
                  }, icon: const Icon(Icons.notifications))
          ),
        ],
      ),
      body: Body(),
    );
  }
}
