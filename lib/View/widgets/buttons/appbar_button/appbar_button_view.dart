import 'package:flutter/material.dart';
import 'package:spisy10/View/Pages/student_form/student_form.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/View/widgets/buttons/pratama_icon_button.dart';
import 'package:spisy10/bloc/page/page_state.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';

class AppbarButtonView extends BasePresenterView{

  AppbarButtonView(BuildContext context){
    setCurrentContext(context);
  }


  Widget appBarBlocBuilder({required BuildContext context, required PageState state,void Function()? onTap}){
    if(state.activePage == 0){
      return PratamaIconButton(
        onTap: onTap ??(){},
        icon: Icons.add,
      );
    }
    return Container();
  }

  onTappedButton(StudentsBloc studentBloc){
    Navigator.of(currentContext!).push(
      PageRouteBuilder(
        pageBuilder: (context,_,__) => StudentForm(
          studentBloc: studentBloc,
        ),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context,anim,_,child){
          return FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                curve: const Interval(0.4, 1,
                  curve: Curves.easeIn
                ),
                parent: anim
              )
            ),
            child: SlideTransition(
              position: Tween<Offset>(begin: const Offset(0,0.1), end: const Offset(0,0)).animate(
                CurvedAnimation(
                  curve: Curves.easeIn,
                  parent: anim
                )
              ),
              child: child,
            ),
          );
        }
      )
    );
  }
}