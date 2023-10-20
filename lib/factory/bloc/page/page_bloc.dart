import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/page/page_bloc_controller.dart';
import 'package:spisy10/factory/bloc/page/page_event.dart';
import 'package:spisy10/factory/bloc/page/page_state.dart';
import 'package:spisy10/factory/impls/bloc/page/page_bloc_controller_i_mpl.dart';

class PageBloc extends Bloc<PageEvent,PageState>{

  late PageBlocController controller;
  PageBloc():super(InitializingPage(activePage: 0)){
    controller = PageBlocControllerIMpl();
    on<ChangingPage>(controller.changingPage);
  }  
}