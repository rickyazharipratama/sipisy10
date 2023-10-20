import 'package:spisy10/View/Fragments/logout/logout_presenter.dart';
import 'package:spisy10/View/Fragments/logout/logout_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/factory/impls/bloc/authentication/events/deleting_active_user_impl.dart';

class LogoutPresenterImpl extends BasePresenter implements LogoutPresenter{

  final LogoutView view;
  final AuthenticationBloc authBloc;

  LogoutPresenterImpl({
    required this.view,
    required this.authBloc
  });

  @override
  void logoutUser(){
     authBloc.add(DeletingActiveUserImpl());
  }
  
  @override
  AuthenticationBloc get currentBloc => authBloc;
  
  @override
  LogoutView get currentView => currentView;
}