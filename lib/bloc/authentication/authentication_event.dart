import 'package:flutter/widgets.dart';
import 'package:spisy10/models/user_auth.dart';
import 'package:spisy10/models/user_model.dart';

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