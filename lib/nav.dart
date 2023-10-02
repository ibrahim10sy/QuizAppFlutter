import 'package:flutter/material.dart';
import 'pages/accueil.dart';
import 'pages/liste.dart';
import 'pages/quiz.dart';
// import 'pages/profile.dart';
import 'pages/comptepublic.dart';



class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}
const d_color = Color(0xFF031B49);

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

List<Widget> _listTab = <Widget>[
   Accueil(),
   Liste(),
   Quiz(),
   Comptepublic()
  //  Profile()

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
      backgroundColor : d_color,
  
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor : d_color,
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Liste',
          backgroundColor : d_color,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz),
          label: 'Quiz',
          backgroundColor : d_color,
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor : d_color,
        ),
        
      ],
      currentIndex: _selectedIndex,
       selectedItemColor: Colors.white,
      onTap: _currentIndex, 
      ),
    );
  }
}