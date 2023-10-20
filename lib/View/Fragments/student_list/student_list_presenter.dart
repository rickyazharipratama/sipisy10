import 'package:spisy10/View/Fragments/student_list/student_list_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';
import 'package:spisy10/warehouse/models/student.dart';

abstract class StudentListPresenter extends BasePresenter{
  StudentListView get currentView;
  StudentsBloc get currentBloc;
  List<Student>? get currentStudents; 
  set currentStudents(List<Student>? students);
}
