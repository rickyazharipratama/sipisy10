import 'package:spisy10/View/Fragments/logout/logout_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';

abstract class LogoutPresenter extends BasePresenter{

  LogoutView  get currentView;
  AuthenticationBloc get currentBloc;
  void logoutUser();
}