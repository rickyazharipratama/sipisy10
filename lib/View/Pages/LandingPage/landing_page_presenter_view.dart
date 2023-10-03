import 'package:flutter/material.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/models/tab_controller_model.dart';

class LandingPagePresenterView extends BasePresenterView{

  PageController? _pageController;
  TabController? _tabController;

  PageController get pageController => _pageController!;
  TabController get tabController => _tabController!;

  LandingPagePresenterView({required BuildContext context, required TickerProvider ticker}){
    setCurrentContext(context);
    setPageController(0);
    setTabController(TabControllerModel(ticker: ticker, length: 2));
  }

  void setPageController(int? initial){
    _pageController = PageController(
      initialPage: initial ?? 0,
      keepPage: true
    );
  }

  void setTabController(TabControllerModel tcm){
    _tabController = TabController(
      length:tcm.length,
      vsync: tcm.ticker,
      initialIndex:0 );
  }
}