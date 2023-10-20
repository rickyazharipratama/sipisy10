import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';

abstract class LogoutView extends BasePresenterView{
  void navigateIntoLoginPage();
}
