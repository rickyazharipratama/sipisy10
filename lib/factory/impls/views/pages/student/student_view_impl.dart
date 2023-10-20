import 'package:flutter/material.dart';
import 'package:spisy10/View/Pages/student_form/student_view.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';

class StudentViewImpl extends BasePresenterView implements StudentView{

  StudentViewImpl({required BuildContext context}){
    setCurrentContext(context);
  }

  @override
  void close(){
    Navigator.of(currentContext!).pop();
  }

}