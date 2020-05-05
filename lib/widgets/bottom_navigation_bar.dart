import 'package:flutter/material.dart';
import '../Color/light_color.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key}) : super(key: key);
  BottomNavigationBarItem _icons(IconData icon){
    return BottomNavigationBarItem(
      icon: Icon(icon,),
      title: Text('')
    );
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor:LightColor.navyBlue2,
      unselectedItemColor: LightColor.grey,
      currentIndex: 0,
        items: [
          _icons(Icons.home,),

          _icons(Icons.person_outline),
        ],
    );
  }
}