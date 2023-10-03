import 'package:flutter/material.dart';
import 'package:spisy10/View/Fragments/student_list_empty.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/View/widgets/components/student_item_list.dart';
import 'package:spisy10/bloc/students/students_state.dart';

class StudentListView extends BasePresenterView{

  StudentListView(BuildContext context){
      setCurrentContext(context);
  }

  Widget studentListBlocBuilder(BuildContext context, StudentsState state){
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
}