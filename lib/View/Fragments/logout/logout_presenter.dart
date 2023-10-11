import 'package:spisy10/View/Fragments/logout/logout_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/bloc/authentication/authentication_bloc.dart';
import 'package:spisy10/bloc/authentication/authentication_event.dart';

class LogoutPresenter extends BasePresenter{

  final LogoutView view;
  final AuthenticationBloc authBloc;

  LogoutPresenter({
    required this.view,
    required this.authBloc
  });

  logoutUser(){
    authBloc.add(DeletingActiveUser());
  }

}