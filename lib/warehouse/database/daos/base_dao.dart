import 'package:spisy10/factory/impls/warehouse/database/database_provider_impl.dart';
import 'package:spisy10/warehouse/database/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class BaseDAO{

  final DatabaseProvider db = DatabaseProviderImpl();
  final String table;

  BaseDAO({required this.table});

  Future<Database?> get connector async{
    return await db.connector;
  }
}