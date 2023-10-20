import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:spisy10/View/Pages/landingPage/landing_page.dart';
import 'package:spisy10/View/Pages/login/Login.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/factory/impls/bloc/authentication/events/validating_user_impl.dart';

abstract class SplashView extends BasePresenterView{

  navigateIntoLandingPage();
  navigateIntoLoginPage();
}

class SplashViewImpl extends BasePresenterView implements SplashView{

  SplashViewImpl({required BuildContext context}){
    setCurrentContext(context);
  }

  @override
  void navigateIntoLandingPage(){
    Navigatorium.instance.newRoute(
      currentContext!, 
      child: const LandingPage()
    );
  }

  @override
  void navigateIntoLoginPage(){
    Navigatorium.instance.newRoute(
      currentContext!, 
      child: const Login()
    );
  }
}