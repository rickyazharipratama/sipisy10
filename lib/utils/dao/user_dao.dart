import 'package:spisy10/models/user_model.dart';
import 'package:spisy10/utils/database_provider.dart';

class UserDao{
  final DatabaseProvider dbProvider = DatabaseProvider.db;

  Future<UserModel?> getActiveUser()async{
    final db = await dbProvider.database;
    var result = await db!.query(userTable);
    List<UserModel> um = result.isNotEmpty ? result.map((e) => UserModel.fromJson(e)).toList():[];
    return um.isNotEmpty ? um[0] : null;
  }

  Future<int> insertUsername(UserModel user) async{
    final db = await dbProvider.database;
    var result = await db!.insert(userTable, user.toJson());
    return result;
  }

  Future<int> deleteUsernae(int id) async{
    final db = await dbProvider.database;
    var result = await db!.delete(userTable,where: "id = ?",whereArgs: [id]);
    return result;
  }

}