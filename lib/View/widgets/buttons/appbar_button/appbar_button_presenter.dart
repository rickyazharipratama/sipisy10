import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button/appbar_button_view.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';

class AppBarButtonPresenter extends BasePresenter{
  final AppbarButtonView view;

  AppBarButtonPresenter({required this.view});

  onAppBarisTapped(){
    view.onTappedButton(BlocProvider.of<StudentsBloc>(view.currentContext!));
  }
}