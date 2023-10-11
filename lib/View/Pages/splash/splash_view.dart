import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:spisy10/View/Pages/LandingPage/landing_page.dart';
import 'package:spisy10/View/Pages/login/Login.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/bloc/authentication/authentication_event.dart';

class SplashView extends BasePresenterView{


  SplashView({required BuildContext context}){
    setCurrentContext(context);
  }

  navigateIntoLandingPage(){
    Navigatorium.instance.newRoute(
      currentContext!, 
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc()..add(Validating()),
        child: const LandingPage(),
      )
    );
  }

  navigateIntoLoginPage(){
    Navigatorium.instance.newRoute(
      currentContext!, 
      child: BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: Login(),
      )
    );
  }
}