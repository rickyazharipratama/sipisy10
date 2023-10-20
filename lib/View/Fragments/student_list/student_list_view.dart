import 'package:flutter/material.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/factory/bloc/students/students_state.dart';

abstract class StudentListView extends BasePresenterView{

  Widget studentListBlocBuilder(BuildContext context, StudentsState state);
}