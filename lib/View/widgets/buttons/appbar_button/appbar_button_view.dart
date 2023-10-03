import 'package:flutter/material.dart';
import 'package:spisy10/View/base/base_presenter_view.dart';
import 'package:spisy10/bloc/page/page_state.dart';

class AppbarButtonView extends BasePresenterView{

  AppbarButtonView(BuildContext context){
    setCurrentContext(context);
  }


  Widget appBarBlocBuilder({required BuildContext context, required PageState state,void Function()? onTap}){
    
    if(state.activePage == 0){
      return  InkWell(
        onTap: onTap??(){},
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20) 
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Color(0xFF666666)
            )
        ) ,
        )
      );
    }
    return Container();
  }
}