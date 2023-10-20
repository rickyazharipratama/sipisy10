import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Fragments/student_list/student_list_presenter.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';
import 'package:spisy10/factory/bloc/students/students_state.dart';
import 'package:spisy10/factory/impls/bloc/students/event/get_students_impl.dart';
import 'package:spisy10/factory/impls/views/fragments/student_list/student_list_presenter_impl.dart';
import 'package:spisy10/factory/impls/views/fragments/student_list/student_list_view_impl.dart';

class StudentList extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
  StudentList({super.key});

  final GlobalKey<RefreshIndicatorState> indicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final StudentListPresenter presenter = StudentListPresenterImpl(
      view: StudentListViewImpl(context),
      studentsBloc: BlocProvider.of<StudentsBloc>(context)
    );
    return BlocListener<StudentsBloc, StudentsState>(
      listenWhen: (prev,current) => current is StudentLoaded || current is StudentIntializing,
      listener: (context, state) {
        if(state is StudentIntializing){
          indicatorKey.currentState!.show();
        } else if(state is StudentLoaded){
          presenter.currentStudents = state.students;
        }
      },
      child: RefreshIndicator(
        key:  indicatorKey,
        triggerMode: RefreshIndicatorTriggerMode.onEdge, 
        onRefresh: () async{
          await Future.delayed(const Duration(milliseconds: 700),
            (){
              presenter.currentBloc.add(GetStudentsImpl());
            }
          );
        },
        child: BlocBuilder<StudentsBloc, StudentsState>(
          builder: presenter.currentView.studentListBlocBuilder,
        ),
      ),
    );
  }
}