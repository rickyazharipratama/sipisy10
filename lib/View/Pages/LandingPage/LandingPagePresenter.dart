import 'package:spisy10/View/Pages/LandingPage/landing_page_presenter_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';

class LandingPagePresenter extends BasePresenter{

  late LandingPagePresenterView _view;


  LandingPagePresenter(){
    _view = LandingPagePresenterView();
  }

  LandingPagePresenterView get view => _view;

}