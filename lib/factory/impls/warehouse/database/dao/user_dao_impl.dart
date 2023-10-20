import 'package:spisy10/warehouse/models/user_model.dart';
import 'package:spisy10/warehouse/database/daos/base_dao.dart';
import 'package:spisy10/warehouse/database/daos/user_dao.dart';

class UserDaoImpl extends BaseDAO implements UserDao{
  
  UserDaoImpl({required super.table});

  @override
  Future<UserModel?> getActiveUser() async{
    List<Map<String, dynamic>?>? res = await connector.then((value) => value!.query(table));
    if(res != null){
      return UserModel.fromJson(res[0]!);
    }
    return null;
  }

  @override
  Future<int> insertUsername(UserModel user) async{
    return await connector.then((value) => value!.insert(table, user.toJson()));
  }

  @override
  Future<int> deleteUsernae(int id) async{
    return await connector.then((value) => value!.delete(table, where: "id=?", whereArgs: [id]));
  }

}