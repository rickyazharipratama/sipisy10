import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:spisy10/View/Pages/landingPage/landing_page.dart';
import 'package:spisy10/View/Pages/login/login_view.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';

class LoginViewImpl extends BasePresenterView implements LoginView{

  LoginViewImpl({required BuildContext context}){
      setCurrentContext(context);
  }

  @override
  void navigateIntoLandingPage(){
    Navigatorium.instance.newRoute(currentContext!, 
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(),
        child: const LandingPage(),
      ),
    );
  }
}