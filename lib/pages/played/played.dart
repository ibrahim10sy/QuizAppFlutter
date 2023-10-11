import 'package:flutter/material.dart';
import 'package:quiz_app/pages/played/body.dart';
import 'package:badges/badges.dart' as badges;
import '../../services/user_service.dart';
import '../notification/notification_page.dart';

class Played extends StatefulWidget {
  const Played({super.key});

  @override
  State<Played> createState() => _PlayedState();
}

class _PlayedState extends State<Played> {
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
        leading: const SizedBox(),
        title: Text('Mes jeux', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        actions: [
          badges.Badge(
              showBadge: (nbNotificationUnread>0)?true:false,
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