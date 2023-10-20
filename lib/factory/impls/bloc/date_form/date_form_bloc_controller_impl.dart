import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_bloc_controller.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_event.dart';
import 'package:spisy10/factory/bloc/date_form/date_form_state.dart';

class DateFormBlocControllerImpl implements DateFormBlocController{

  @override
  Future<void> countingAge(CountingDifferenceAge event, Emitter<DateFormState> emit)  async{
    print("called");
    emit(SuccessCounted(diffAge: event.diff));
  }

}