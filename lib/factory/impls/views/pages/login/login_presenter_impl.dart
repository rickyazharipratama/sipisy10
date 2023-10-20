import 'package:flutter/widgets.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';
import 'package:spisy10/View/Pages/login/login_presenter.dart';
import 'package:spisy10/View/Pages/login/login_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/factory/impls/bloc/authentication/events/authenticating_impl.dart';
import 'package:spisy10/warehouse/models/user_auth.dart';

class LoginPresenterImpl extends BasePresenter implements LoginPresenter{

  final AuthenticationBloc authBloc;
  final LoginView view;

   late PratamaTextFieldPresenter usernamePresenter;
   late PratamaTextFieldPresenter passwordPresenter;

  LoginPresenterImpl({required this.authBloc, required this.view}){

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

  @override
  void authenticatiog(){
    UserAuth auth = UserAuth(username: usernamePresenter.textController.value.text, password: passwordPresenter.textController.value.text);
    authBloc.add(AuthenticatingImpl(user: auth));
  }
  
  @override
  PratamaTextFieldPresenter get currentPasswordPresenter => passwordPresenter;
  
  @override
  PratamaTextFieldPresenter get currentUsernamePresenter => usernamePresenter;
  
  @override
  LoginView get currentView => view;
}