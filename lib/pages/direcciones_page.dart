import 'package:flutter/material.dart';
import 'package:flutter_application_qr/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(Icons.add_location, color: Theme.of(context).primaryColor),
        title: Text(scans[i].valor),
        subtitle: Text(scans[i].id.toString()),
        trailing:  Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
        onTap: () => print(scans[i].id),
      )
      );
  }
}