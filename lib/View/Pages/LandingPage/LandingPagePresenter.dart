import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Pages/LandingPage/landing_page_presenter_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/bloc/page/page_bloc.dart';
import 'package:spisy10/bloc/page/page_event.dart';
import 'package:spisy10/bloc/page/page_state.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/models/tab_controller_model.dart';

class LandingPagePresenter extends BasePresenter{

  final LandingPagePresenterView view;
  late PageBloc pageBloc;
  late StudentsBloc studentBLoc;
  
  

  LandingPagePresenter({required this.view}){
    pageBloc =PageBloc();
    studentBLoc = StudentsBloc();
  }


  pageViewBlocListener(BuildContext context, PageState state){
    if(state is PageChanged){
      view.pageController.animateToPage(state.activePage, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  PageBloc pageProvider(BuildContext context){
    return pageBloc;
  }

  StudentsBloc studentPRovider(BuildContext context){
    return studentBLoc;
  }

  tabBarIsTapped(int value){
    BlocProvider.of<PageBloc>(view.currentContext!).add(ChangingPage(index: value));
  }

  @override
  void dispose() {
    super.dispose();
    pageBloc.close();
    studentBLoc.close();
  }
}