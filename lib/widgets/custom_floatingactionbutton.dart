import 'package:flutter/material.dart';
import 'package:flutter_application_qr/providers/scan_list_provider.dart';
import 'package:flutter_application_qr/utils/utils.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class CustomFloatingActionButton extends StatelessWidget {
  //const CustomFloatingActionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      child: Icon(
        Icons.filter_center_focus
      ),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    '#3D8BEF', 
                                                    'Cancelar', 
                                                    false, 
                                                    ScanMode.QR);
        print(barcodeScanRes);
       
        if(barcodeScanRes == '-1') return;

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
       
        final nuevoScan = await  scanListProvider.nuevoScan(barcodeScanRes);

        launchURL(context, nuevoScan);
        
      }
      );
  }
}