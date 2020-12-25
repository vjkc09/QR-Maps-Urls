import 'package:flutter/material.dart';
import 'package:flutter_application_qr/pages/home_page.dart';
import 'package:flutter_application_qr/pages/mapa_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mapa': (BuildContext context) => MapaPage(),
      },
      
    );
  }
}