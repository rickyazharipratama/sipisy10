import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button/appbar_button_presenter.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button/appbar_button_view.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';
import 'package:spisy10/factory/bloc/students/students_event.dart';

class AppBarButtonPresenterImpl extends BasePresenter implements AppBarButtonPresenter{

  final AppbarButtonView view;
  final  StudentsBloc studentsBloc;
  AppBarButtonPresenterImpl({required this.view, required this.studentsBloc});

  @override
  void onAppBarisTapped(){
    view.onTappedButton(studentsBloc,onRefresh: onNeedRefreshStudents);
  }

  @override
  void onNeedRefreshStudents(){
    studentsBloc.add(InitializeStudent());
  }
  
  @override
  StudentsBloc get currentStudentBloc => studentsBloc;
  
  @override
  AppbarButtonView get currentView => view;
}