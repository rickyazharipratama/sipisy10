import 'package:spisy10/View/Pages/splash/splash_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';

abstract class SplashPresenter extends BasePresenter{

  AuthenticationBloc get currentAuthBloc;
  SplashView get currentView;
  Future<void> goToLandingPage();
  Future<void> goToLoginPage();
  bool get isNeedToShowLoading;
  set isNeedToShowLoading(bool val);
}