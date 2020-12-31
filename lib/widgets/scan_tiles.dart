import 'package:flutter/material.dart';
import 'package:flutter_application_qr/providers/scan_list_provider.dart';
import 'package:flutter_application_qr/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({@required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
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
                              Provider.of<ScanListProvider>(context,
                                      listen: false)
                                  .borrarScanPorId(scans[i].id);
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
                leading: Icon(
                  this.tipo == 'http'
                    ? Icons.map
                    : Icons.add_location, 
                  color: Theme.of(context).primaryColor),
                title: Text(scans[i].valor),
                subtitle: Text(scans[i].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => launchURL(context, scans[i]),
              ),
            ));
  }
}
