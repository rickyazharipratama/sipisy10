import 'package:spisy10/View/Fragments/student_list/student_list_presenter.dart';
import 'package:spisy10/View/Fragments/student_list/student_list_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';
import 'package:spisy10/factory/bloc/students/students_event.dart';
import 'package:spisy10/warehouse/models/student.dart';

class StudentListPresenterImpl extends BasePresenter implements StudentListPresenter{

  final StudentListView view;
  final StudentsBloc studentsBloc;
  List<Student>? students;

  StudentListPresenterImpl({required this.view, required this.studentsBloc}){
    students = [];
    studentsBloc.add(InitializeStudent());
  }
  
  @override
  StudentsBloc get currentBloc => studentsBloc;
  
  @override
  List<Student>? get currentStudents => students;
  
  @override
  StudentListView get currentView => view;
  
  @override
  set currentStudents(List<Student>? std) {
    students = std;
  }
}
