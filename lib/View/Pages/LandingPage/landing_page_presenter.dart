import 'package:flutter/material.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/page/page_bloc.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';

abstract class LandingPagePresenter extends BasePresenter{
  PageController get pageController;
  void pageViewBlocListener(int nextPage);
  PageBloc get currentPageBloc;
  StudentsBloc get currentStudentBloc;
  void navigationBarOnTapped(int index);
  void setPageController(int? initial);
}