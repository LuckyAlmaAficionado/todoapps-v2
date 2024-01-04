import 'dart:io';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/app/models/model_task.dart';
import 'package:todo/app/models/model_tile_task.dart';

class DatabaseInstance {
  final String _databaseName = "v1.db";
  final int _databaseVersion = 1;

  // Table Task
  final String tableTask = "task";
  final String idTask = "id";
  final String uuidTask = "uuid";
  final String title = "title";
  final String icons = "icons";

  // Table Task Tile
  final String tableTileTask = "tile";
  final String idTile = "id";
  final String uuidTile = "uuid";
  final String subTitle = "subtitle";
  final String isDone = "isDone";

  Database? _database;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase();
    return _database!;
  }

  Future _initializeDatabase() async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    String path = join(documentDir.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $tableTileTask ($idTile INTEGER PRIMARY KEY, $uuidTile TEXT, $subTitle TEXT, $isDone INTEGER)");

    await db.execute(
        "CREATE TABLE $tableTask ($idTask INTEGER PRIMARY KEY, $uuidTask TEXT, $title TEXT, $icons INTEGER)");

    Get.snackbar("Congratulations", "Berhasil membuat database");
  }

  Future<List<ModelTask>> getDataModelTask() async {
    List<ModelTask> result;
    final data = await _database!.query(tableTask);

    result = data.map((e) {
      return ModelTask.fromJson(e);
    }).toList();

    for (int i = 0; i < data.length; i++) {
      List<ModelTileTask> temp = await getDataByUuid(data[i]['uuid'] as String);
      result[i].content = temp;
    }
    return result;
  }

  Future<List<ModelTileTask>> getDataModelTileTask() async {
    final data = await _database!.query(tableTileTask);
    List<ModelTileTask> result =
        data.map((e) => ModelTileTask.fromJson(e)).toList();
    return result;
  }

  Future<ModelTask> fetchDataTaskByUuid(String uuid) async {
    final data = await _database!
        .query(tableTask, where: "$uuidTask = ?", whereArgs: [uuid]);
    List<ModelTask> result =
        await data.map((e) => ModelTask.fromJson(e)).toList();

    List<ModelTileTask> tileTask =
        await getDataByUuid(data[0]['uuid'] as String);
    result[0].content = tileTask;

    return result[0];
  }

  Future<List<ModelTileTask>> getDataByUuid(String uuid) async {
    final data = await _database!
        .query(tableTileTask, where: "$uuidTile = ?", whereArgs: [uuid]);
    List<ModelTileTask> result =
        await data.map((e) => ModelTileTask.fromJson(e)).toList();
    return result;
  }

  Future<int> insertTask(Map<String, dynamic> values) async {
    final query = await _database!.insert(tableTask, values);
    return query;
  }

  Future<int> insertTileTask(Map<String, dynamic> values) async {
    final query = await _database!.insert(tableTileTask, values);
    return query;
  }

  // update functions
  Future<int> updateTileTask(int idParam, Map<String, dynamic> values) async {
    final query = await _database!.update(tableTileTask, values,
        where: '$idTile = ?', whereArgs: [idParam]);
    return query;
  }

  // delete functions

  Future<void> deleteDatabaseV1(String path) =>
      databaseFactory.deleteDatabase(path);

  Future<void> clearDatabase() async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, _databaseName);

      // delete the database
      await deleteDatabase(path);
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteTask(String uuid) async {
    try {
      Database db = await _initializeDatabase(); // Pastikan await digunakan
      await db.delete(tableTask, where: '$uuidTask = ?', whereArgs: [uuid]);
      await db.delete(tableTileTask, where: '$uuidTile = ?', whereArgs: [uuid]);
    } catch (e) {
      throw e;
    }
  }
}
