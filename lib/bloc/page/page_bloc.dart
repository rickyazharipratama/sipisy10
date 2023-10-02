import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/bloc/page/page_event.dart';
import 'package:spisy10/bloc/page/page_state.dart';

class PageBloc extends Bloc<PageEvent,PageState>{

  PageBloc():super(InitializingPage(activePage: 0)){
    on<ChangingPage>(_changingPage);
  }


  FutureOr<void> _changingPage(ChangingPage event, Emitter<PageState> emit) {
    emit(PageChanged(
      active: event.index
    ));
  }
}