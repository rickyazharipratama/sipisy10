import 'package:flutter/widgets.dart';
import 'package:spisy10/warehouse/models/user_auth.dart';
import 'package:spisy10/warehouse/models/user_model.dart';

@immutable
abstract class AuthenticationEvent{

}

abstract class Authenticating extends AuthenticationEvent{
  UserAuth get currentUser;
  bool get isValidUser;
  Future<bool> insertingeUser(UserModel usr);
}

abstract class ValidatingUser extends AuthenticationEvent{
  Future<UserModel?> get getActiveUser;
  bool isLoginTimeExpired(DateTime valid);
  Future<void> clearActiveUser(int id);
}

abstract class DeletingActiveUser extends AuthenticationEvent{
  
  Future<void> deletingUser(int id);

}

class Preparing extends AuthenticationEvent{}
