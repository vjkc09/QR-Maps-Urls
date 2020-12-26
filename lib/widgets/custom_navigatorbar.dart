import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_qr/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  //const CustomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);

    final _currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i ) => uiProvider.selectedMenuOpt = i,
      currentIndex: _currentIndex,
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