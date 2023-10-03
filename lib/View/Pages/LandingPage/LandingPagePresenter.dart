import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/Pages/LandingPage/landing_page_presenter_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/bloc/page/page_bloc.dart';
import 'package:spisy10/bloc/page/page_event.dart';
import 'package:spisy10/bloc/page/page_state.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';
import 'package:spisy10/bloc/students/students_event.dart';
import 'package:spisy10/models/tab_controller_model.dart';
import 'package:spisy10/utils/database_provider.dart';

class LandingPagePresenter extends BasePresenter{

  late LandingPagePresenterView _view;
  late PageBloc pageBloc;
  late StudentsBloc studentBLoc;
  
  

  LandingPagePresenter(BuildContext context, TickerProvider ticker){
    _view = LandingPagePresenterView()
    ..setCurrentContext(context)
    ..setPageController(0)
    ..setTabController(
      TabControllerModel(
        ticker: ticker, length: 2)
    );
    pageBloc =PageBloc();
    studentBLoc = StudentsBloc();
  }

  LandingPagePresenterView get view => _view;

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
    // TODO: implement dispose
    super.dispose();
    pageBloc.close();
    studentBLoc.close();
  }

}