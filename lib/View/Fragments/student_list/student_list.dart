import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Fragments/student_list/student_list_view.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';
import 'package:spisy10/bloc/students/students_state.dart';
import 'package:spisy10/View/Fragments/student_list/student_list_presenter.dart';

class StudentList extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
  StudentList({super.key});

  final GlobalKey<RefreshIndicatorState> indicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final StudentListPresenter presenter = StudentListPresenter(
      view: StudentListView(context),
      studentsBloc: BlocProvider.of<StudentsBloc>(context)
    );
    return BlocListener<StudentsBloc, StudentsState>(
      listenWhen: (prev,current) => current is StudentLoaded || current is StudentIntializing,
      listener: (context, state) {
        if(state is StudentIntializing){
          indicatorKey.currentState!.show();
        } else if(state is StudentLoaded){
          presenter.students = state.students;
        }
      },
      child: RefreshIndicator(
        key:  indicatorKey,
        triggerMode: RefreshIndicatorTriggerMode.onEdge, 
        onRefresh: () async{
          await Future.delayed(const Duration(milliseconds: 700),
            (){
              presenter.studentsBloc.add(GetStudents());
            }
          );
        },
        child: BlocBuilder<StudentsBloc, StudentsState>(
          builder: presenter.view.studentListBlocBuilder,
        ),
      ),
    );
  }
}