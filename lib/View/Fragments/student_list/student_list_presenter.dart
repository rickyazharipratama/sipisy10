import 'package:spisy10/View/Fragments/student_list/student_list_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';
import 'package:spisy10/models/student.dart';

class StudentListPresenter extends BasePresenter{

  final StudentListView view;
  final StudentsBloc studentsBloc;
  List<Student>? students;

  StudentListPresenter({required this.view, required this.studentsBloc}){
    students = [];
    studentsBloc.add(InitializeStudent());
  }
}