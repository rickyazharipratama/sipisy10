import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc_controller.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_event.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_state.dart';
import 'package:spisy10/factory/utils/log.dart';
import 'package:spisy10/warehouse/models/user_model.dart';

class AuthenticatingBlocControllerImpl implements AuthenticatingBlocController{
  final AuthenticationState state;

  AuthenticatingBlocControllerImpl({required this.state});

  @override
  Future<void> deletingActiveUser(DeletingActiveUser event, Emitter<AuthenticationState> emit) async{
    if(state.user == null){
      emit(NoActiveUser(message: "noActiveUSer"));
    }else{
      try{
         await event.deletingUser(state.user!.id!);
         emit(ActiveUserDeleted(message: "userDeleted"));
      }catch(e){
        Log(e);
      }
    }
  }

  @override
  Future<void> loginAuthentication(Authenticating event, Emitter<AuthenticationState> emit) async{
      if(state.message != null){
      state.message = null;
    }
    if(event.isValidUser){
      UserModel user = UserModel(
        username: event.currentUser.username,
        valid: DateTime.now()
      );
      bool isInsert = await  event.insertingeUser(user);
      if(isInsert){
        emit(LoginSuccess(user: user));
      }else{
        emit(LoginFailed(message: "Terjadi kelakahan pada sistem, cobalah beberapa saat lagi."));
      }
    }else{
      emit(LoginFailed(message: "Username atau password yang Anda masukkan tidak terdaftar."));
    }
  }

  @override
  Future<void> prepareUser(Preparing event, Emitter<AuthenticationState> emit) async{
    state.message = null;
    emit(UserPrepared(message: "userPrepared"));
  }

  @override
  Future<void> validatingActiveUser(ValidatingUser event, Emitter<AuthenticationState> emit) async{
    state.user = await event.getActiveUser;
    if(state.message != null){
      state.message = null;
    } 
    if(state.user == null){
      emit(NoActiveUser(message: "noActiveUSer"));
    }else{
      if(event.isLoginTimeExpired(state.user!.valid!)){
        event.clearActiveUser(state.user!.id!);
        emit(ActiveUserDeleted(message: "userDeleted"));
      }else{
        emit(UserStillActive(user: state.user));
      }
    }
  }
}