import 'package:spisy10/models/user_model.dart';
import 'package:spisy10/utils/dao/user_dao.dart';

class UserRepository{
  final UserDao ud = UserDao();

  Future<UserModel?> getActiveUser() =>ud.getActiveUser();
  Future<int> insertActiveUser(UserModel user) => ud.insertUsername(user);
  Future<int> deleteActiveUser(int id) => ud.deleteUsernae(id);
}