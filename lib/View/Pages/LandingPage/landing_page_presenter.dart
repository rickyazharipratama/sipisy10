import 'package:flutter/material.dart';
import 'package:spisy10/View/Pages/LandingPage/landing_page_presenter_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/bloc/page/page_bloc.dart';
import 'package:spisy10/bloc/page/page_event.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';
import 'package:spisy10/utils/log.dart';

class LandingPagePresenter extends BasePresenter{

  final LandingPagePresenterView view;
  late PageBloc pageBloc;
  late StudentsBloc studentBLoc;
  
  

  LandingPagePresenter({required this.view}){
    pageBloc =PageBloc();
    studentBLoc = StudentsBloc();
  }


  pageViewBlocListener(int nextPage){
    print("state index: "+pageBloc.state.activePage!.toString());
    view.pageController.animateToPage(nextPage, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  PageBloc pageProvider(BuildContext context){
    return pageBloc;
  }

  StudentsBloc studentPRovider(BuildContext context){
    return studentBLoc;
  }

  navigationBarOnTapped(int index){
    Log("tapped : $index");
    pageBloc.add(ChangingPage(index: index));
  }

  @override
  void dispose() {
    super.dispose();
    pageBloc.close();
    studentBLoc.close();
  }
}