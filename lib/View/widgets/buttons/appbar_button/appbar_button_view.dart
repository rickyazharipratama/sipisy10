import 'package:flutter/material.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/factory/bloc/page/page_state.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';

abstract class AppbarButtonView extends BasePresenterView{

  Widget appBarBlocBuilder({required BuildContext context, required PageState state,void Function()? onTap});
  void onTappedButton(StudentsBloc studentBloc,{VoidCallback? onRefresh});
}