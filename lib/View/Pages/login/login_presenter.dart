import 'package:flutter/widgets.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';
import 'package:spisy10/View/Pages/login/login_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/bloc/authentication/authentication_event.dart';
import 'package:spisy10/models/user_auth.dart';

class LoginPresenter extends BasePresenter{
  final AuthenticationBloc authBloc;
  final LoginView view;

   late PratamaTextFieldPresenter usernamePresenter;
   late PratamaTextFieldPresenter passwordPresenter;

  LoginPresenter({required this.authBloc, required this.view}){

    usernamePresenter = PratamaTextFieldPresenter(
      label: "Username",
      keyboardType: TextInputType.emailAddress,
      validator: onUsernameValidation
    );

    passwordPresenter = PratamaTextFieldPresenter(
      label: "Password",
      keyboardType: TextInputType.visiblePassword,
      validator: onPasswordValidation,
      isObscured: true
    );
    print(authBloc);
  }


  String? onUsernameValidation(String? val){
    if(val != null){
      if(val.isEmpty){
        return "Silakan masukkan username Anda";
      }
    }
    return null;
  }

  String? onPasswordValidation(String? val){
    if(val != null){
      if(val.isEmpty){
        return "Silakan masukkan password Anda";
      }
    }
    return null;
  }

  void authenticatiog(){
    UserAuth auth = UserAuth(username: usernamePresenter.textController.value.text, password: passwordPresenter.textController.value.text);
    authBloc.add(Authenticating(user: auth));
  }
}