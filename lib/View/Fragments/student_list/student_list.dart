import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Fragments/student_list/student_list_view.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_state.dart';
import 'package:spisy10/View/Fragments/student_list/student_list_presenter.dart';

class StudentList extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
  StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentListPresenter presenter = StudentListPresenter(view: StudentListView(context));
    return BlocBuilder<StudentsBloc,StudentsState>(
      builder: presenter.view.studentListBlocBuilder
    );
  }
}