import 'package:flutter/material.dart';
import 'package:flutter_application_qr/pages/direcciones_page.dart';
import 'package:flutter_application_qr/pages/mapas_page.dart';
import 'package:flutter_application_qr/providers/ui_provider.dart';
import 'package:flutter_application_qr/widgets/custom_floatingactionbutton.dart';
import 'package:flutter_application_qr/widgets/custom_navigatorbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  //const _HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtener ele selected menu opt
    final uiProvider = Provider.of<UIProvider>(context);
    // Cambiar para mostrar la pagina respectiva
    final paginaActual = uiProvider.selectedMenuOpt;

    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
