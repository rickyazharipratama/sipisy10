import 'package:spisy10/factory/impls/warehouse/database/dao/user_dao_impl.dart';
import 'package:spisy10/warehouse/models/user_model.dart';
import 'package:spisy10/warehouse/constant_collection.dart';
import 'package:spisy10/warehouse/database/daos/user_dao.dart';
import 'package:spisy10/warehouse/repos/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  
  final UserDao _dao = UserDaoImpl(table: ConstantCollection.collection.table.user);
  
  @override
  Future<int> deleteActiveUser(int id) async => await _dao.deleteUsernae(id);
  
  @override
  Future<UserModel?> getActiveUser() async => await _dao.getActiveUser();
  
  @override
  Future<int> insertActiveUser(UserModel user) async => await _dao.insertUsername(user);

  

}

