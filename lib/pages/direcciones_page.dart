import 'package:flutter/material.dart';
import 'package:flutter_application_qr/widgets/scan_tiles.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
   return ScanTiles(tipo: 'http');
  }
}