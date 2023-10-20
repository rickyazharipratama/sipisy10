import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/page/page_event.dart';
import 'package:spisy10/factory/bloc/page/page_state.dart';

abstract class PageBlocController{
  Future<void> changingPage(ChangingPage event, Emitter<PageState> emit);
}
