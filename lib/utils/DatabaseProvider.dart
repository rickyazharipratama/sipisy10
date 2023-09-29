import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const studentTable = "students";

class DatabaseProvider{

  static final DatabaseProvider db = DatabaseProvider();
  
  Database? _database ;

  Future<Database?> get database async{
    if(_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async{
    Directory docDir = await getApplicationDocumentsDirectory(); 
    String pth = join (docDir.path,"student.db");
    return await openDatabase(pth,
      version :1,
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
      "CREATE TABLE IF NOT EXIST $studentTable ("
      "id INTEGER PRIMARY KEY, "
      "name TEXT, "
      "date TEXT, "
      "age int, "
      "gender TEXT,"
      "address TEXT"
      ")"
    );
  }
}