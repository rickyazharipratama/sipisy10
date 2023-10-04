import 'package:flutter/material.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';

class LandingPagePresenterView extends BasePresenterView{

  PageController? _pageController;

  PageController get pageController => _pageController!;

  LandingPagePresenterView({required BuildContext context}){
    setCurrentContext(context);
    setPageController(0);
  }

  void setPageController(int? initial){
    _pageController = PageController(
      initialPage: initial ?? 0,
      keepPage: true
    );
  }
}