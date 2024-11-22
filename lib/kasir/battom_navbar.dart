
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int selectedItem;
  BottomNav({super.key, required this.selectedItem});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedNavbar = 0;
  void changeSelectedNavBar(int index) {
    setState(() {
      selectedNavbar = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/kasir');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/detail');
    } 
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.point_of_sale),
          label: 'Kasir',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_rounded),
          label: 'Detail',
        ),
        
      ],
      selectedItemColor: Color.fromARGB(255, 0, 6, 66),
      unselectedItemColor: Color.fromARGB(255, 92, 90, 96),
      showUnselectedLabels: true,
      currentIndex: widget.selectedItem,
      onTap: changeSelectedNavBar,
      );
    }
}
