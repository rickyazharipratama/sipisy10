import 'package:flutter/material.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';

class StudentView extends BasePresenterView{


  StudentView({required BuildContext context}){
    setCurrentContext(context);
  }

  close(){
    Navigator.of(currentContext!).pop();
  }
}