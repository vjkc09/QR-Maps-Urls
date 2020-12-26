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

    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    // Verificar la DB
    final db = await database;

    final res = await db.rawInsert('''
        INSERT Into Scans (id, tipo, valor)
          VALUES ($id, '$tipo', '$valor') 
      ''');
    return res;
  }

  Future<int> newScan( ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.insert('Scans', nuevoScan.toJson() );
    print('newScan: $res');
    // Id del ultimo registro insertado
    return res;
  }

  // SELECT - Obtener Informacion
  Future<ScanModel> getScanById( int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    print('Respuesta: $res');
    return res.isNotEmpty 
              ? ScanModel.fromJson(res.first) 
              : null;
  }

  Future<List<ScanModel>> getScans() async {
    // Get de referencia a la DB
    final db = await database;
    // Query obtener todos los registros
    final res = await db.query('Scans');

    List<ScanModel> list = res.isNotEmpty 
                              ? res.map((s) => ScanModel.fromJson(s) ).toList()
                              : [];
    return list;
  }

  Future<List<ScanModel>> getScansByType( String tipo ) async {
    // Get de referencia a la DB
    final db = await database;
    // Query obtener todos los registros
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');

    List<ScanModel> list = res.isNotEmpty 
                              ? res.map((s) => ScanModel.fromJson(s) ).toList()
                              : [];
    return list;
  }

  // Actualizar registros
  Future<int> updateScan(ScanModel nuevoScan) async {

    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id] );
    return res;

  }

  // Eliminar registros 
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans',  where: 'id = ?', whereArgs: [id] );
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }

  Future<int> deleteRawAllScans() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Scans');
    return res;
  }



}