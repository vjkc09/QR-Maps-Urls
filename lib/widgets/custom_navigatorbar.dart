import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  //const CustomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapa')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_movies),
          title: Text('Direcciones')
        )
      ]
    );
  }
}