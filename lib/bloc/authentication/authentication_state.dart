import 'package:spisy10/models/user_auth.dart';
import 'package:spisy10/models/user_model.dart';

abstract class AuthenticationState{
  UserModel? user;
  String? message;
  AuthenticationState({this.user, this.message});
}


class LoginInit extends AuthenticationState{}

class LoginSuccess extends AuthenticationState{ 
  LoginSuccess({super.user});
}

class LoginFailed extends AuthenticationState{
  LoginFailed({super.message});
}

class Error extends AuthenticationState{

}

class NoActiveUser extends AuthenticationState{
  NoActiveUser({String? message}) : super(message: message);
}

class ActiveUserDeleted extends AuthenticationState{
  ActiveUserDeleted({String? message}) : super(message: message);
}
class UserStillActive extends AuthenticationState{
  UserStillActive({super.user});
}
