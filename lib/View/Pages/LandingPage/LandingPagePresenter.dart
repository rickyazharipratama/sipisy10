import 'package:flutter/widgets.dart';
import 'package:spisy10/View/Pages/LandingPage/landing_page_presenter_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';

class LandingPagePresenter extends BasePresenter{

  late LandingPagePresenterView _view;


  LandingPagePresenter({required BuildContext context}){
    _view = LandingPagePresenterView()..setCurrentContext(context);
  }

  LandingPagePresenterView get view => _view;

}