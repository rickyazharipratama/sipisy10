import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button/appbar_button_view.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';

abstract class AppBarButtonPresenter extends BasePresenter{
  
  AppbarButtonView get currentView;
  StudentsBloc get currentStudentBloc;
  void onAppBarisTapped();
  void onNeedRefreshStudents();
}