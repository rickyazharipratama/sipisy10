import 'package:spisy10/warehouse/models/user_model.dart';
import 'package:spisy10/warehouse/database/daos/base_dao.dart';

abstract class UserDao extends BaseDAO{
  UserDao({required super.table});


  Future<UserModel?> getActiveUser();
  Future<int> insertUsername(UserModel user);
  Future<int> deleteUsernae(int id);
}
