import 'package:spisy10/models/user_auth.dart';

abstract class AuthenticationState{
  UserAuth? user;
  AuthenticationState({this.user});
}


class LoginInit extends AuthenticationState{}

class LoginSuccess extends AuthenticationState{

}

class LoginFailed extends AuthenticationState{
  
}

class Error extends AuthenticationState{

}
