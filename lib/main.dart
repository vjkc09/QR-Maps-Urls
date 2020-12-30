import 'package:flutter/material.dart';
import 'package:flutter_application_qr/pages/home_page.dart';
import 'package:flutter_application_qr/pages/mapa_page.dart';
import 'package:flutter_application_qr/providers/scan_list_provider.dart';
import 'package:flutter_application_qr/providers/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UIProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR App',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'mapa': (BuildContext context) => MapaPage(),
        },
        theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurpleAccent)),
      ),
    );
  }
}
