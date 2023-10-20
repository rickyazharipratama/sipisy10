import 'package:spisy10/warehouse/models/user_model.dart';

abstract class UserRepository{
  Future<UserModel?> getActiveUser();
  Future<int> insertActiveUser(UserModel user);
  Future<int> deleteActiveUser(int id);
}
