import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Fragments/student_list_empty.dart';
import 'package:spisy10/View/widgets/components/student_item_list.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_state.dart';

class StudentList extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
  StudentList({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsBloc,StudentsState>(
      builder: (context, state){
        if(state  is StudentUpdated && state.students!.isNotEmpty){
          return ListView.builder(
            itemCount: state.students!.length,
            itemBuilder: (context,i){
              return StudentItemList(
                student: state.students![i],
              );
            }
          );
        }else{
          return const StudentListEmpty();
        }
      }
    );
  }
}