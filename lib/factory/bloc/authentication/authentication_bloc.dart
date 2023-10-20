import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc_controller.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_event.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_state.dart';
import 'package:spisy10/factory/impls/bloc/authentication/authenticating_bloc_controller_impl.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{
  
  late AuthenticatingBlocController  controller;

  AuthenticationBloc() : super(LoginInit()) {
    controller = AuthenticatingBlocControllerImpl(state: state);
    on<Authenticating>(controller.loginAuthentication);
    on<ValidatingUser>(controller.validatingActiveUser);
    on<Preparing>(controller.prepareUser);
    on<DeletingActiveUser>(controller.deletingActiveUser);
  }
}