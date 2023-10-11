import 'package:flutter/widgets.dart';
import 'package:spisy10/models/user_auth.dart';

@immutable
abstract class AuthenticationEvent{

}

class Authenticating extends AuthenticationEvent{
  final UserAuth user;
  Authenticating({required this.user});
}

class Validating extends AuthenticationEvent{
  Validating();
}

class DeletingActiveUser extends AuthenticationEvent{
  DeletingActiveUser();
}

class Preparing extends AuthenticationEvent{}