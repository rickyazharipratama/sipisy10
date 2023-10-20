import 'package:spisy10/View/Pages/splash/splash_presenter.dart';
import 'package:spisy10/View/Pages/splash/splash_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_event.dart';

class SplashPresenterImpl extends BasePresenter implements SplashPresenter{

  final AuthenticationBloc authBloc;
  final SplashView view;
  bool isNeedShowLoading = false;

  SplashPresenterImpl({
    required this.authBloc,
    required this.view
  }){
    authBloc.add(Preparing());
  }

  @override
  Future<void> goToLandingPage() async{
    await Future.delayed(
      const Duration(milliseconds: 500),
      () {},
    ).whenComplete((){
      view.navigateIntoLandingPage();
    });
  }

  @override
  Future<void> goToLoginPage() async{
    await Future.delayed(
      const Duration(milliseconds: 500),
      (){}
    ).whenComplete(() => view.navigateIntoLoginPage());
  }
  
  @override
  AuthenticationBloc get currentAuthBloc => authBloc;
  
  @override
  SplashView get currentView => view;

  @override
  bool get isNeedToShowLoading => isNeedShowLoading;

  @override
   set isNeedToShowLoading(bool val){
    isNeedShowLoading = val;
   }
}