import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/pages/categories.dart';
import 'pages/home/home.dart';
import 'pages/liste.dart';
import 'pages/quiz.dart';
import 'pages/profile.dart';



class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}
final bottomNavigationBackgroundColor = kAppBarColor;

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

List<Widget> _listTab = <Widget>[
   Home(),
   Liste(),
   Categorie(),
   Profile()

];

  void _currentIndex (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Center(
        child: _listTab.elementAt(_selectedIndex),
      ), 
      
     bottomNavigationBar: BottomNavigationBar(
      backgroundColor : bottomNavigationBackgroundColor,
  
      items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor : bottomNavigationBackgroundColor,
          ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.list),
          label: 'Liste',
          backgroundColor : bottomNavigationBackgroundColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.add_box_outlined),
          label: 'Quiz',
          backgroundColor : bottomNavigationBackgroundColor,
        ),
        
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: 'Profile',
          backgroundColor : bottomNavigationBackgroundColor,
        ),
        
      ],
      currentIndex: _selectedIndex,
       selectedItemColor: Colors.white,
      onTap: _currentIndex, 
      ),
    );
  }
}