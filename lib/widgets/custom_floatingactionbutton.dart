import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  //const CustomFloatingActionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      child: Icon(
        Icons.filter_center_focus
      ),
      onPressed: () {}
      );
  }
}