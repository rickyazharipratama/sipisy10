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
    on<Preparing>(_prepareUser);
    on<DeletingActiveUser>(_deletingActiveUser);
  }



  FutureOr<void> _loginAuthentication(Authenticating event, Emitter<AuthenticationState> emit)  async{
    if(state.message != null){
      state.message = null;
    }
    if(event.user.username == loginCompare && event.user.password == loginCompare){
      UserModel user = UserModel(
        username: event.user.username,
        valid: DateTime.now()
      );
      try{
        await repository.insertActiveUser(user);
        emit(LoginSuccess(user: user));
      }catch(e){
        Log(e);
      }
    }else{
      emit(LoginFailed(message: "Username atau password yang Anda masukkan tidak terdaftar."));
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

  FutureOr<void> _prepareUser(Preparing event, Emitter<AuthenticationState> emit) {
    state.message = null;
    emit(UserPrepared(message: "userPrepared"));
  }

  FutureOr<void> _deletingActiveUser(DeletingActiveUser event, Emitter<AuthenticationState> emit) async{
    if(state.user == null){
      emit(NoActiveUser(message: "noActiveUSer"));
    }else{
      try{
         await repository.deleteActiveUser(state.user!.id!);
         emit(ActiveUserDeleted(message: "userDeleted"));
      }catch(e){
        Log(e);
      }
    }
  }
}