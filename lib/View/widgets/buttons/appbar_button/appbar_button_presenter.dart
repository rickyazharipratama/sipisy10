import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button/appbar_button_view.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';

class AppBarButtonPresenter extends BasePresenter{
  final AppbarButtonView view;
  final  StudentsBloc studentsBloc;
  AppBarButtonPresenter({required this.view, required this.studentsBloc});

  onAppBarisTapped(){
    view.onTappedButton(studentsBloc,onRefresh: onNeedRefreshStudents);
  }

  onNeedRefreshStudents(){
    studentsBloc.add(InitializeStudent());
  }
}