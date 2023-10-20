import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:spisy10/View/Fragments/logout/logout_view.dart';
import 'package:spisy10/View/Pages/login/login.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';

class LogoutViewImpl extends BasePresenterView implements LogoutView{

  LogoutViewImpl({required BuildContext context}){
    setCurrentContext(context);
  }

  @override
  void navigateIntoLoginPage(){
    Navigatorium.instance.newRoute(
      currentContext!,
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(),
        child: Login(),
      ),
    );
  }
}