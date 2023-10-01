import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/bloc/authentication/authentication_event.dart';
import 'package:spisy10/bloc/authentication/authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{
  
  
  AuthenticationBloc() : super(LoginInit()){
    on<Authenticating>(_loginAuthentication);
  }



  FutureOr<void> _loginAuthentication(Authenticating event, Emitter<AuthenticationState> emit) {
    
  }
}