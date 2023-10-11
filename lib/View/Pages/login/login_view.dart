import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:spisy10/View/Pages/LandingPage/landing_page.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/bloc/authentication/authentication_bloc.dart';

class LoginView extends BasePresenterView{

  LoginView({required BuildContext context}){
      setCurrentContext(context);
  }

  navigateIntoLandingPage(){
    Navigatorium.instance.newRoute(currentContext!, 
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(),
        child: const LandingPage(),
      ),
    );
  }
}