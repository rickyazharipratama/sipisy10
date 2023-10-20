import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';
import 'package:spisy10/View/Pages/login/login_view.dart';
import 'package:spisy10/View/base/base_presenter.dart';

abstract class LoginPresenter extends BasePresenter{
  LoginView get currentView;
  PratamaTextFieldPresenter get currentUsernamePresenter;
  PratamaTextFieldPresenter get currentPasswordPresenter;
  void authenticatiog();
}