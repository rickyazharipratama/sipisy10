import 'package:flutter/material.dart';

class BasePresenterView{

  BuildContext? _currentContext;

  BuildContext? get currentContext => _currentContext;

  void setCurrentContext(BuildContext context){
    _currentContext = context;
  }
}