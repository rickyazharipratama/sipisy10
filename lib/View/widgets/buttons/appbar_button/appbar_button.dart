import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button/appbar_button_presenter.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button/appbar_button_view.dart';
import 'package:spisy10/bloc/page/page_bloc.dart';
import 'package:spisy10/bloc/page/page_state.dart';
import 'package:spisy10/bloc/students/students_bloc.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppBarButtonPresenter presenter = AppBarButtonPresenter(
      view: AppbarButtonView(context),
      studentsBloc: BlocProvider.of<StudentsBloc>(context)
    );
    return BlocBuilder<PageBloc, PageState>(
      builder: (context,state){
         return presenter.view.appBarBlocBuilder(
          context: context, 
          state: state,
          onTap: presenter.onAppBarisTapped
        );
      }
    );
  }
}