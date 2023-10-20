import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/page/page_bloc_controller.dart';
import 'package:spisy10/factory/bloc/page/page_event.dart';
import 'package:spisy10/factory/bloc/page/page_state.dart';

class PageBlocControllerIMpl implements PageBlocController{

  @override
  Future<void> changingPage(ChangingPage event, Emitter<PageState> emit) async{
    emit(PageChanged(active: event.index));
  }
}