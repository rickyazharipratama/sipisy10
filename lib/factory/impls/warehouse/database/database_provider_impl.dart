import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spisy10/warehouse/constant_collection.dart';
import 'package:spisy10/warehouse/database/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProviderImpl implements DatabaseProvider{

  Database? _database ;

  @override
  Future<Database?> get connector async{
    if(_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async{
    Directory docDir = await getApplicationDocumentsDirectory(); 
    String pth = join (docDir.path,"student.db");
    return await openDatabase(pth,
      version :3,
      onCreate: initDB,
      onUpgrade: onUpgrade
    );
  }

  void onUpgrade(
    Database database,
    int oldVersion,
    int newVersion
  ){
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute(
      "CREATE TABLE ${ConstantCollection.collection.table.student} ("
        "id INTEGER PRIMARY KEY, "
        "name TEXT, "
        "date TEXT, "
        "age int, "
        "gender int,"
        "address TEXT"
      ")"
    );
    await database.execute(
      "CREATE TABLE ${ConstantCollection.collection.table.user} ("
        "id INTEGER PRIMARY KEY, "
        "username TEXT, "
        "valid  TEXT"
      ")"
    );
  }
}