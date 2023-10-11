import 'package:navigatorium/navigatorium.dart';
import 'package:spisy10/View/Pages/splash/splash_view.dart';
import 'package:spisy10/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/bloc/authentication/authentication_event.dart';

class SplashPresenter{

  final AuthenticationBloc authBloc;
  final SplashView view;
  bool isNeedShowLoading = false;

  SplashPresenter({
    required this.authBloc,
    required this.view
  }){
    authBloc.add(Preparing());
  }

  Future<void> goToLandingPage() async{
    await Future.delayed(
      const Duration(milliseconds: 500),
      () {},
    ).whenComplete((){
      view.navigateIntoLandingPage();
    });
  }

  Future<void> goToLoginPage() async{
    await Future.delayed(
      const Duration(milliseconds: 500),
      (){}
    ).whenComplete(() => view.navigateIntoLoginPage());
  }

}