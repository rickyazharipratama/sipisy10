import 'package:flutter/widgets.dart';
import 'package:spisy10/View/Pages/landingPage/landing_page_presenter.dart';
import 'package:spisy10/View/base/base_presenter.dart';
import 'package:spisy10/factory/bloc/page/page_bloc.dart';
import 'package:spisy10/factory/bloc/page/page_event.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';
import 'package:spisy10/factory/utils/log.dart';

class LandingPagePresenterImpl extends BasePresenter implements LandingPagePresenter{

  late PageBloc pageBloc;
  late StudentsBloc studentBLoc;
  late PageController _pageController;

  LandingPagePresenterImpl(){
    pageBloc =PageBloc();
    studentBLoc = StudentsBloc();
   setPageController(0);
  }
  @override
  void setPageController(int? initial){
    _pageController = PageController(
      initialPage: initial ?? 0,
      keepPage: true
    );
  }

  @override
  void pageViewBlocListener(int nextPage){
    print("state index: "+pageBloc.state.activePage!.toString());
    pageController.animateToPage(nextPage, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void navigationBarOnTapped(int index){
    Log("tapped : $index");
    pageBloc.add(ChangingPage(index: index));
  }

   @override
  void dispose() {
    super.dispose();
    pageBloc.close();
    studentBLoc.close();
  }
  
  @override
  PageBloc get currentPageBloc => pageBloc;
  
  @override
  StudentsBloc get currentStudentBloc => studentBLoc;
  
  @override
  PageController get pageController => _pageController;
}