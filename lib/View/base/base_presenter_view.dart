import 'package:flutter/material.dart';

class BasePresenterView{

  BuildContext? _currentContext;

  BuildContext? get currentContext => _currentContext;

  setCurrentContext(BuildContext context){
    _currentContext = context;
  }
}