import 'package:flutter/material.dart';
import 'package:flutter_application_qr/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class MapasPage extends StatelessWidget {
  //const MapasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              /* onDismissed: (DismissDirection direction) {
                scanListProvider.borrarScanPorId(scans[i].id);
              }, */
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirmas eliminar"),
                      content: const Text(
                          "¿Estás seguro de eliminar este elemento?"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[i].id);
                              Navigator.of(context).pop(true);
                            },
                            child: const Text("Eliminar")),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Cancelar"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ListTile(
                leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
                title: Text(scans[i].valor),
                subtitle: Text(scans[i].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => print(scans[i].id),
              ),
            ));
  }
}
