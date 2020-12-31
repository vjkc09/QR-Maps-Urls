import 'package:flutter/material.dart';
import 'package:flutter_application_qr/widgets/scan_tiles.dart';

class MapasPage extends StatelessWidget {
  //const MapasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}
