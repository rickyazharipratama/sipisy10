import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:spisy10/View/Pages/login/login.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/bloc/authentication/authentication_bloc.dart';

class LogoutView extends BasePresenterView{


  LogoutView({required BuildContext context}){
    setCurrentContext(context);
  }

  navigateIntoLoginPage(){
    Navigatorium.instance.newRoute(
      currentContext!,
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(),
        child: Login(),
      ),
    );
  }

}