import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/bloc/authentication/authentication_event.dart';
import 'package:spisy10/bloc/authentication/authentication_state.dart';
import 'package:spisy10/models/user_model.dart';
import 'package:spisy10/utils/log.dart';
import 'package:spisy10/utils/repository/user_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{
  
  final UserRepository repository = UserRepository();
  final String loginCompare = "spisy10mobile";
  final int expiredLogin = 15;

  AuthenticationBloc() : super(LoginInit()){
    on<Authenticating>(_loginAuthentication);
    on<Validating>(_validatingActiveUser);
  }



  FutureOr<void> _loginAuthentication(Authenticating event, Emitter<AuthenticationState> emit) {
    if(state.message != null){
      state.message = null;
    }
    if(event.user.username == loginCompare && event.user.password == loginCompare){
      UserModel user = UserModel(
        username: event.user.username,
        valid: DateTime.now()
      );
      try{
        repository.insertActiveUser(user);
        emit(LoginSuccess(user: user));
      }catch(e){
        Log(e);
      }
    }else{
      emit(LoginFailed(message: "loginFailed"));
    }
  }

  FutureOr<void> _validatingActiveUser(Validating event, Emitter<AuthenticationState> emit) async{
    state.user = await repository.getActiveUser();
    if(state.message != null){
      state.message = null;
    }
    if(state.user == null){
      emit(NoActiveUser(message: "noActiveUSer"));
    }else{
      Duration diff =  DateTime.now().difference(state.user!.valid!);
      if(diff.inMinutes >= expiredLogin){
        repository.deleteActiveUser(state.user!.id!);
        emit(ActiveUserDeleted(message: "userDeleted"));
      }else{
        emit(UserStillActive(user: state.user));
      }
    }
  }
}