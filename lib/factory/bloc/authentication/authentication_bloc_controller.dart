import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_event.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_state.dart';

abstract class AuthenticatingBlocController{
  Future<void> loginAuthentication(Authenticating event, Emitter<AuthenticationState> emit);
  Future<void> validatingActiveUser(ValidatingUser event, Emitter<AuthenticationState> emit);
  Future<void> prepareUser(Preparing event, Emitter<AuthenticationState> emit);
  Future<void> deletingActiveUser(DeletingActiveUser event, Emitter<AuthenticationState> emit);
}
