import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/View/widgets/buttons/appbar_button/appbar_button_presenter.dart';
import 'package:spisy10/factory/bloc/page/page_bloc.dart';
import 'package:spisy10/factory/bloc/page/page_state.dart';
import 'package:spisy10/factory/bloc/students/students_bloc.dart';
import 'package:spisy10/factory/impls/views/widgets/buttons/appbar_button/app_bar_button_presenter_impl.dart';
import 'package:spisy10/factory/impls/views/widgets/buttons/appbar_button/appbar_button_view_impl.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppBarButtonPresenter presenter = AppBarButtonPresenterImpl(
      view: AppbarButtonViewImpl(context),
      studentsBloc: BlocProvider.of<StudentsBloc>(context)
    );
    return BlocBuilder<PageBloc, PageState>(
      builder: (context,state){
         return presenter.currentView.appBarBlocBuilder(
          context: context, 
          state: state,
          onTap: presenter.onAppBarisTapped
        );
      }
    );
  }
}