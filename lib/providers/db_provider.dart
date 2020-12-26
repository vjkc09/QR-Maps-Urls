import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_application_qr/models/scan_model.dart'; 
export 'package:flutter_application_qr/models/scan_model.dart'; 

class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    // Path donde se almacena la DB
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(
      path,
      version: 2,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
         await db.execute('''
        CREATE TABLE Scans (
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
            )
        ''');
      },
    );
  }

  // CREAR Registros
  nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.rawInsert(
        "INSERT Into Scans (id, tipo, valor) "
        "VALUES (${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}') ");
    return res;
  }

}